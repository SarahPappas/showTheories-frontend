<newTheory class="new-theory-container { hidden: isHidden }">
	<div class="subpage-title">Add your latest theory</div>
	<form class="new-theory-form">
		<div>
			<div class="new-theory-line">What show?</div>
			<input type="text" ref="showTitle">
		</div>
		<div>
			<div class="new-theory-line">Your Theory:</div>
			<textarea ref="content" class="new-theory-content"></textarea>
		</div>
		<div>
			<div class="new-theory-line">Who's theory is this?</div>
			<input type="text" ref="authorName">
		</div>
		<div class="button-main new-theory-line" onclick={ add }>Add</div>
		<div class="button back" onclick={ changeView }>back</div>
	</form>


	<script type="text/javascript">
		this.isHidden = activeViewModel.isHidden("newTheory");

		this.add = function (e) {
			e.preventDefault();
			var newTheory = {};
			newTheory.content = this.refs.content.value;
			newTheory.authorName = this.refs.authorName.value;
			newTheory.showTitle = this.refs.showTitle.value.toLowerCase();
			newTheory.upvotesCount = 0;
			newTheory.downvotesCount = 0;
			theoriesModel.addTheory(newTheory);
			this.changeView();
		}.bind(this);

		this.changeView = function () {
 			activeViewModel.changeActiveView("theoryList");
		};

		activeViewModel.on("viewChange", function () {
			this.isHidden = activeViewModel.isHidden("newTheory");
			this.update();
		}.bind(this));
	</script>
</newTheory>