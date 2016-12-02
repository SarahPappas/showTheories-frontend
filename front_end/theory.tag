<theory class="theory">
	<div>{ opts.data.showTitle }</div>
	<div>{ opts.data.content }</div>
	<div class="author">- { opts.data.authorName }</div>
	<div>
		<div onclick={ upvote } class="button">upvote</div>
		<div class="votes">
			{ opts.data.upvotesCount }
		</div>
		<div class="votes">
			{ opts.data.downvotesCount }
		</div>
		<div onclick={ downvote } class="button">downvote</div>
		<hr>
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
</theory>