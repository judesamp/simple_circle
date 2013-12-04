App = Ember.Application.create();

App.ApplicationAdapter = DS.FixtureAdapter.extend();

App.Router.map(function() {
  this.resource('article');
  this.resource('issues', function() {
    this.route('create');
    this.resource('issue', {path: ":issue_id"}, function() {
        this.route('edit_issue_name');
        this.route('add_article');
        this.route('add_event');
        this.route('preview');
        this.route('summary');
    });
    
  });

});

App.ApplicationRoute = Ember.Route.extend({
	setupController: function(controller,model) {
        controller.set('model', model);//UsersEditController
        this.controllerFor('newsletter').set('model',this.store.find('newsletter', 1));
        this.controllerFor('issues').set('model',this.store.find('issue'));
  },

	model: function () {
    return this.store.find('organization', 1);
  }
});

App.IndexRoute = Ember.Route.extend({
	model: function () {
    return this.store.find('newsletter', 1);
  }
});


App.IssuesRoute = Ember.Route.extend({
  model: function () {
    return this.store.find('issue');
  }
});


App.IssueRoute = Ember.Route.extend({
  setupController: function(controller,model) {
        controller.set('model', model);//UsersEditController
        this.controllerFor('article').set('model',this.store.find('article'));
  },

  model: function(params) {
    return issues.findBy('id', params.issue_id);
  }
});









App.ApplicationController = Ember.ObjectController.extend({
  needs: ["newsletter", "issues", "issue"],

  isEditingTitle: false,
  isEditingSubtitle: false,
  isEditingOrgName: false,

  actions: {
    editTitle: function() {
      this.set('isEditingTitle', true)
    },

    doneEditingTitle: function() {
      this.set('isEditingTitle', false)
    },

    editSubtitle: function() {
      this.set('isEditingSubtitle', true)
    },

    doneEditingSubtitle: function() {
      this.set('isEditingSubtitle', false)
    },

    editOrgName: function() {
      this.set('isEditingOrgName', true)
    },

    doneEditingOrgName: function() {
      this.set('isEditingOrgName', false)
    },

    createNewIssue: function () {
      // Get the todo title set by the "New Todo" text field
      
      // Create the new Todo model
      var issue = this.store.createRecord('issue', {
        draft_name: "default issue name"
      });

      // Save the new model
      issue.save();
    }

  }
});

App.IssueController = Ember.ObjectController.extend({
  needs: ["newsletter", "issue", "article"],
  isEditingIssueName: false,

  actions: {
    editIssueName: function() {
      this.set('isEditingIssueName', true)
    },

    doneEditingIssueName: function() {
      this.set('isEditingIssueName', false)
    },

    startGalleria: function() {
      Galleria.run('.galleria', {responsive:true,height:0.5625});
    },

    createNewPost: function(issue, post_position) {
      var position = post_position;
      var post = this.store.createRecord('post', {
        position: entered_position,
        issue: issue
      });
      post.save();
      return post;
    },



    createNewArticle: function (issue) {
      // Get the todo title set by the "New Todo" text field
      var title = this.get('article_title');
      if (!title.trim()) { return; }
      var author = this.get('author');
      var article_text = this.get('article_text');
      var article_position = this.get('position');
      
      var post = createNewPost(issue, article_position);

      // Create the new Todo model
      var article = this.store.createRecord('article', {
        title: title,
        author: author,
        body: article_text,
        post: post
      });


      // Save the new model
      article.save();
    }

  }
});

App.IssueSummaryController = Ember.ObjectController.extend({
  needs: ["newsletter", "issue", "article"]
});







App.NewsletterController = Ember.ObjectController.extend({
});

App.IssuesController = Ember.ArrayController.extend({
});

App.ArticleController = Ember.ArrayController.extend({
});








App.Organization = DS.Model.extend({
  name: DS.attr('string'),
  email: DS.attr('string'),
  newsletter: DS.attr()

});

App.Newsletter = DS.Model.extend({
	title: DS.attr('string'),
  subtitle: DS.attr('string')
});

App.Issue = DS.Model.extend({
	draft_name: DS.attr('string'),
  articles: DS.hasMany('article')
});

App.Article = DS.Model.extend({
  author: DS.attr('string'),
  title: DS.attr('string'),
  body: DS.attr('string'),
  issue: DS.belongsTo('post')
});


App.Post = DS.Model.extend({
  position: DS.attr('integer'),
  articles: DS.hasMany('article'),
  events: DS.hasMany('event'),
  issue: DS.belongsTo('issue')
});





App.Organization.FIXTURES = [{
   id: 1,
   name: 'Jerome',
   email: 'email@email.com',
   mars: 'planet'
 }];

App.Newsletter.FIXTURES = [{
   		id: 1,
   		title: "single fixture title",
   		subtitle: "single fixture subtitle"
 }];

 App.Issue.FIXTURES = [{
   		id: 1,
   		draft_name: "draft_name"
 }, 

 {
      id: 2,
      draft_name: "Another issuename"
 },

 {
      id: 3,
      draft_name: "Draft #3"
 }
 ];

App.Article.FIXTURES = [
{
      id: 1,
      title: "draft_name",
      author: "meeeee!",
      body: "this is the body of the article"
} 
]
 






