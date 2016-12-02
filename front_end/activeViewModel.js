function ActiveViewModel() {
	riot.observable(this);

	this.activeView = "home";
}

ActiveViewModel.prototype = {
	changeActiveView: function (tagName) {
		this.activeView = tagName;
		this.trigger("viewChange");
	},
	isHidden: function (tagName) {
		if (this.activeView == tagName) {
			return false;
		} else {
			return true;
		}
	}
}

var activeViewModel = new ActiveViewModel();