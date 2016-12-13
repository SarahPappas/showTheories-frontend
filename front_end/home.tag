<home class={ hidden: isHidden }>
	<div class="home-container">
		<div class="title">
			ShowTheories
		</div>
		<div class="quote">
				"The best way to predict the future is to create it."
			<div class="quote-author">
				- Peter Drucker
			</div>
		</div>
		<div onclick={ changeView } class="button-main">Peruse</div>
	</div>

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
		.home-container {
			/* box */
			width: 100%;
			height: 100%;
			display: flex;
			flex-direction: column;

			/* flex child properties */
			justify-content: space-around;

		}

		.title {
			/* box */
			display: block;
			margin-top: -15px;
			margin-bottom: -40px;
			padding-top: 40px;

			/* text */
			font-size: 180px;
			text-align: center;
		}

		.quote {
			/* box */
			padding: 40px 20px;

			/* text */
			font-size: 100px;
			font-style: italic;
			line-height: 1.25;
			text-align: center;
		}

		.quote-author {
			/* text */
			font-size: 24px;
			font-style: none;
		}

		@media (max-width: 768px) {
			.title {
				/* box */
				margin-top: -13.5px;
				margin-bottom: -36px;
				padding-top: 40px;

				/* text */
				font-size: 100px;
			}

			.quote {
				/* text */
				font-size: 70px;
			}

			.button-main {
				/* text */
				font-size: 40px;
			}
		}

		@media (max-width: 350px) {
			.title {
				/* box */
				margin-top: -6.75px;
				margin-bottom: -18px;
				padding-top: 20px;

				/* text */
				font-size: 70px;
			}

			.quote {
				/* text */
				font-size: 50px;
			}
		}
	</style>
</home>