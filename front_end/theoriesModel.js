function TheoriesModel() {
	// Makes TheoriesModel an event emitter.
	riot.observable(this);

	this._theories = [
		{
			content:"Dorian will stab the painting.",
			authorName: "Bob",
			upvotesCount: 3,
			downvotesCount: 4,
			showTitle: "penny dreadful"
		},
		{
			content:"Dorian will stab the painting.",
			authorName: "Bob",
			upvotesCount: 3,
			downvotesCount: 4,
			showTitle: "penny dreadful"
		}
	];

	this.reloadTheories();

	this.isLoading = false;
}

TheoriesModel.prototype = {
	getTheories: function () {
		return _.cloneDeep(this._theories);
	},
	getTheoryById: function (id) {
		return _.cloneDeep(this._getTheoryById(id));
	},
	updateTheory: function (theory, vote) {
		if (this.isLoading) {
			this.trigger("error", "you've alredy voted");
			return;
		}
		var index = this._getTheoryIndexById(theory.id);
		this._theories[index] = _.cloneDeep(theory);
		this.trigger("change");
		this._httpRequest("PUT", "https://showtheories.herokuapp.com/theories/"+theory.id+"/"+vote, JSON.stringify(theory))
			.then(function (response) {
				var errorMsg = JSON.parse(response).error;
				if(errorMsg) {
					this.trigger("error", errorMsg);
					this.reloadTheories();
					this.isLoading = false;
				}
			}.bind(this));
	},
	addTheory: function (theory) {
		this._theories.push(_.cloneDeep(theory));
		this.trigger("change");
		this._httpRequest("POST", "https://showtheories.herokuapp.com/theories", JSON.stringify(theory))
			.then(function (response) {
				var errorMsg = JSON.parse(response).error;
				if(errorMsg) {
					this.trigger("error", errorMsg);
					this.reloadTheories();
				}
			}.bind(this));
	},
	reloadTheories: function () {
		this._httpRequest("GET", "https://showtheories.herokuapp.com/theories")
			.then(function (responseText) {
				this._theories = JSON.parse(responseText);
				this.trigger("change");
			}.bind(this));
	},
	_getTheoryById: function (id) {
		var index = this._getTheoryIndexById(id);
		return this._theories[index];
	},
	_getTheoryIndexById: function (id) {
		for (var i = 0; i < this._theories.length; i++) {
			var theory = this._theories[i];
			if (theory.id == id) {
				return i;
			}
		}
	},
	_httpRequest: function (method, url, body) {
		return new Promise(function (resolve, reject) {
			this.isLoading = true;
			var request = new XMLHttpRequest();
	
			request.addEventListener("load", function () {
				resolve(request.responseText);
			}.bind(this));
	
			request.addEventListener("error", function (err) {
				reject(err);
			});
			
			request.open(method, url);

			if (body) {
				request.setRequestHeader("Content-Type", "application/json; charset=utf-8");
			}
			request.send(body);
		});
	}
};

var theoriesModel = new TheoriesModel();
