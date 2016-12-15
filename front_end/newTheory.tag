<newTheory class="new-theory-container { hidden: isHidden }">
	<div class="subpage-title">Add your latest theory</div>
	<form class="new-theory-form">
		<div>
			<div>What show?</div>
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
		<div class="new-theory-line">
			<div class="button" onclick={ changeView }>back</div>
		</div>
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

	<style type="text/css">
		.new-theory-form {
			/* box */
			width: 425px;
			/*height: 425px;*/
			margin: 0 auto;
			padding: 25px;
			border: solid 2px white;
			/* text */
			font-size: 32px;
			text-align: center;
		}

		.new-theory-container {
			/* box */
			width: 100%;
			height: 100%;
			padding: 4px;
		}

		.new-theory-line {
			/* box */
			margin-top: 15px;
		}

		.new-theory-content {
			/* box */
			width: 300px;
			height: 100px;
			border-radius: 1;
			
			/* text */
			font-size: 24px;
		}

		input {
			/* box */
			border-radius: 1;

			/* text */
			font-size: 24px;
		}
		
		@media (max-width: 768px) {
			.new-theory-form {
				/* box */
				width: 350px;
				/*height: 400px;*/
				padding: 20px;

			}

			.new-theory-content {
				width: 200px;
			}
		}

		@media (max-width: 414px) {
			.new-theory-form {
				width: 250px;
				padding: 10px;
			}
		}

	</style>
</newTheory>