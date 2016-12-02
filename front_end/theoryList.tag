<theoryList class="theories { hidden: isHidden }">
	<div class="subpage-title">Read or 
		<div onclick={ changeView } class="button-main">Add</div>
		<input ref="input" oninput={ searchTheories } placeholder="search by show" class="new-theory-line search"></input>
		<!-- <button onchange={ searchTheories }>submit</button> -->
	</div>
	<hr>
	<div class="theories-container">
		<theory each={ theories } data={ this }></theory>
	</div>

	<script type="text/javascript">
		this.isHidden = activeViewModel.isHidden("theoryList");

		this._sortTheories = function () {
			this.theories = _.sortBy(this.theories, function (theory) {
				return -(theory.upvotesCount + theory.downvotesCount);
			}.bind(this));
		};

		this._updateTheories = function () {
			this.theories = theoriesModel.getTheories();
			this._sortTheories();
			this.update();
		};

		theoriesModel.on("error", function (errorMsg) {
			window.alert(errorMsg);
		});

		theoriesModel.on("change", function () {
			this._updateTheories();
			this.searchTheories();
		}.bind(this));

		this.changeView = function () {
 			activeViewModel.changeActiveView("newTheory");
		};

		activeViewModel.on("viewChange", function() {
			this.isHidden = activeViewModel.isHidden("theoryList");
			this.update();
			console.log("theoryList hidden?", this.isHidden);
		}.bind(this));

		this.searchTheories = function () {
			this.theories = theoriesModel.getTheories();
			var input = this.refs.input.value.toLowerCase();
			this.theories = _.filter(this.theories, function(theory) { 
				return _.startsWith(theory.showTitle, input);
			});
			this.update();
		}.bind(this);

		this._updateTheories();
	</script>
</theoryList>