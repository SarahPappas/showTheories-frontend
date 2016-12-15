<theoryList class="{ hidden: isHidden }">
	<div class="theories">
		<div class="subpage-title">Read or 
			<div onclick={ _changeView } class="button-main">Add</div>
			<input ref="input" oninput={ _updateTheories } placeholder="search by show" class="new-theory-line search"></input>
		</div>
		<hr>
		<div class="theories-container">
			<theory each={ theories } data={ this }></theory>
		</div>
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
			width: 100%;
			display: flex;
			flex-direction: column;

			/* effects */
			overflow: hidden;
		}

		.theories .subpage-title {
			flex-grow: 0;
			flex-shrink: 0;
		}

		.theories-container {
			/* box */
			flex-grow: 1;
			flex-shrink: 1;

			/* effects */
			overflow: scroll;
		}

		.search {
			/* box */
			width: 200px;
			border-radius: 0;
			display: block;
			margin: 0 auto;
			margin-top: 20px;
			padding: 4px;
			padding-top: 8px;

			/* text */
			font-size: 30px;
			font-family: OstrichSansRegular, arial;
		}

		@media (max-width: 768px) {
			.search {
				/* text */
				font-family: OstrichSansRegular, arial;
			}
		}
	</style>
</theoryList>