App = Ember.Application.create();

App.Router.map(function() {
  this.resource('greeting');
  
  
  this.resource('issues', function() {
  	this.route('select');
  	this.resource('issue', {path: ":issue_id"}, function() {
  		this.route('add_article');
  		this.route('add_event');
  		this.route('preview');
  });
  });
  this.resource('newsletter');
  this.resource('about');
  this.resource('account');
});

App.ApplicationRoute = Ember.Route.extend({
  model: function() {
    return organization;
  }
});



App.IssuesRoute = Ember.Route.extend({
  model: function() {
    return issues;
  },

  renderTemplate: function() {
    this.render('issues', {outlet: "nav"});
  }

});

App.NewsletterRoute = Ember.Route.extend({
  model: function() {
    return newsletter;
  }
});






App.IndexRoute = Ember.Route.extend({
	model: function() {
    return newsletter;
  },

  renderTemplate: function() {
    this.render('greeting');
  }
});


App.IssueController = Ember.ObjectController.extend({
	isEditing: false,

	actions: {
		edit: function() {
			this.set('isEditing', true)
		},

		doneEditing: function() {
			this.set('isEditing', false)
		}
	}

});

App.NewsletterController = Ember.ObjectController.extend({
	isEditing: false,

	actions: {
		edit: function() {
			this.set('isEditing', true)
		},

		doneEditing: function() {
			this.set('isEditing', false)
		}
	}

});




var organization = {
	id: '1',
	name: "Highland Hills",
	newsletter: {
	id: '1',
	name: "The Hills Are Alive!",
	subtitle: "With the Sound of Music"
}
}

var newsletter = {
	id: '1',
	name: "The Hills Are Alive!",
	subtitle: "With the Sound of Music"
}

var issues = [{
	id: '1',
	name: "the issue name"
	},

	{
		id: '2',
		name: "the second issue name"

	}]

