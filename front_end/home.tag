<home class={ hidden: isHidden }>
	<div class="title">ShowTheories</div>
		<div class="quote">
			<div>
				"The best way to predict the future is to create it."
			</div>
			<div class="quote-author">
				- Peter Drucker
			</div>
		</div>
	</div>
	<div onclick={ changeView } class="button-main">Peruse</div>

	<script type="text/javascript">
		this.isHidden = activeViewModel.isHidden("home");

		this.changeView = function () {
 			activeViewModel.changeActiveView("theoryList");
		};

		activeViewModel.on("viewChange", function () {
			this.isHidden = activeViewModel.isHidden("home");
			this.update();
		}.bind(this));
	</script>

	<style type="text/css">
		
	</style>
</home>