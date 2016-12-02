function TheoriesModel() {
	// Makes TheoriesModel an event emitter.
	riot.observable(this);

	this._theories = [
		{ 
			id: 1,
			content: "Arnold is not real",
			authorName: "Sarah",
			upvotesCount: 10,
			downvotesCount: 5,
			showTitle: "Westworld"
		},
		{ 
			id: 2,
			content: "Charolette Hale is also a host",
			authorName: "Tebo",
			upvotesCount: 3,
			downvotesCount: 7,
			showTitle: "Westworld"
		},
		{ 
			id: 3,
			content: "Maeve will escape",
			authorName: "Gerry",
			upvotesCount: 1,
			downvotesCount: 14,
			showTitle: "Westworld"
		},
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
		this._httpRequest("PUT", "http://localhost:3000/theories/"+theory.id+"/"+vote, JSON.stringify(theory))
			.then(function (response) {
				console.log(response);
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
		this._httpRequest("POST", "http://localhost:3000/theories", JSON.stringify(theory))
			.then(function (response) {
				console.log(JSON.parse(response));
				var errorMsg = JSON.parse(response).error;
				if(errorMsg) {
					this.trigger("error", errorMsg);
					this.reloadTheories();
				}
			}.bind(this));
	},
	reloadTheories: function () {
		this._httpRequest("GET", "http://localhost:3000/theories")
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
				console.log(err);
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
