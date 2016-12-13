<theoryList class="theories { hidden: isHidden }">
	<div class="subpage-title">Read or 
		<div onclick={ _changeView } class="button-main">Add</div>
		<input ref="input" oninput={ _updateTheories } placeholder="search by show" class="new-theory-line search"></input>
	</div>
	<hr>
	<div class="theories-container">
		<theory each={ theories } data={ this }></theory>
	</div>

	<script type="text/javascript">
		this.isHidden = activeViewModel.isHidden("theoryList");

		this._sortTheories = function () {
			this.theories = _.sortBy(this.theories, [function (theory) {
				return -(theory.upvotesCount + theory.downvotesCount);
			}]);
		};

		this._updateTheories = function () {
			this.theories = theoriesModel.getTheories();
			this._filterTheories();
			this._sortTheories();
			this.update();
		};

		theoriesModel.on("error", function (errorMsg) {
			window.alert(errorMsg);
		});

		theoriesModel.on("change", function () {
			this._updateTheories();
		}.bind(this));

		this._changeView = function () {
 			activeViewModel.changeActiveView("newTheory");
		};

		activeViewModel.on("viewChange", function() {
			this.isHidden = activeViewModel.isHidden("theoryList");
			this.update();
		}.bind(this));

		this._filterTheories = function () {
			var inputEl = this.refs.input;
			if (!inputEl) {
				return;
			}

			var searchTerm = inputEl.value.toLowerCase();
			this.theories = _.filter(this.theories, function(theory) { 
				return _.startsWith(theory.showTitle, searchTerm);
			});
		}.bind(this);

		this._updateTheories();
	</script>

	<style type="text/css">
		.theories {
			/* box */
			height: 100%;

			/* effects */
			overflow: hidden;
		}

		.theories-container {
			/* box */
			height: 400px;

			/* effects */
			overflow: scroll;
		}

		.search {
			/* box */
			width: 18em;
			margin-top: 15px;
		}

	</style>
</theoryList>