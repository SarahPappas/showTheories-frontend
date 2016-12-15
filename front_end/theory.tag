<theory>
	<div class="theory">
		<div>{ opts.data.showTitle }</div>
		<div class="content">{ opts.data.content }</div>
		<div class="author">- { opts.data.authorName }</div>
		<div class="vote-container">
			<div class="upvotes-row">
				<div onclick={ upvote } class="button">upvote</div>
				<div class="votes">
					{ opts.data.upvotesCount }
				</div>
			</div>
			<div class="downvotes-row">
				<div class="votes">
					{ opts.data.downvotesCount }
				</div>
				<div onclick={ downvote } class="button">downvote</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		this.upvote = function (e) {
			e.preventUpdate = true;
			var theory = theoriesModel.getTheoryById(opts.data.id);
			theory.upvotesCount++;
			theoriesModel.updateTheory(theory, "upvote");
		};

		this.downvote = function (e) {
			e.preventUpdate = true;
			var theory = theoriesModel.getTheoryById(opts.data.id);
			theory.downvotesCount++;
			theoriesModel.updateTheory(theory, "downvote");
		};
	</script>

	<style type="text/css">
		.votes {
			/* box */
			display: inline-block;
			padding: 0 8px;
			margin-bottom: -.3em;
			vertical-align: text-bottom;
		}

		.content {
			/* box */
			margin-top: 10px;
		}

		.vote-container{
			/* box */
			margin-top: 10px;
			display: flex;
			justify-content: center;
		}

		.author {
			/* text */
			font-size: 16px;
			font-style: italic;
		}

		.theory .button {
			/* box */
			width: 80px;
			padding-top: .4em;
			text-indent: .17em;
		}

		@media (max-width: 768px) {
			.vote-container {
				flex-direction: column;
			}

			.upvotes-row {
				display: flex;
				justify-content: center;
			}

			.downvotes-row {
				display: flex;
				flex-direction: row-reverse;
				justify-content: center;
			}
		}

	</style>
</theory>