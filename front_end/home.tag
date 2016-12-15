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
		<div class="flex-child">
			<div onclick={ changeView } class="button-main">Peruse</div>
		</div>
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
			justify-content: space-between;

		}

		.title {
			/* box */
			display: block;
			margin-top: 40px;
			margin-bottom: -.3em;

			/* text */
			font-family: OstrichSansDashed, arial;
			font-size: 180px;
			text-align: center;
		}

		.quote {
			/* box */
			padding: 0 20px;

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

		.flex-child {
			display: flex;
			align-items: center;
			justify-content: center;
			flex-shrink: 0;
		}

		.home-container .button-main {
			margin-bottom: 40px;
			display: inline-block;
		}

		@media (max-width: 768px) {
			.title {
				/* text */
				font-family: OstrichSansRegular, arial;
				font-size: 100px;
			}

			.quote {
				/* text */
				font-size: 70px;
			}
		}

		@media (max-width: 414px) {
			.title {
				/* text */
				font-size: 70px;
			}

			.quote {
				/* text */
				font-size: 40px;
			}
		}
	</style>
</home>