App = Ember.Application.create();

App.ApplicationAdapter = DS.FixtureAdapter.extend();

App.Router.map(function() {
  this.resource('article');
  this.resource('event');
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
        this._super(controller,model);
        controller.set('model', model);
        this.controllerFor('article').set('model',this.store.find('article'));
        this.controllerFor('event').set('model',this.store.find('event'));
        this.controllerFor('video').set('model',this.store.find('video'));
        this.controllerFor('post').get('model');

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
  needs: ["newsletter", "issue", "article", "post", "event", "video"],

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

    startDatepicking: function() {
      $( "#end_date_datepicker" ).datepicker();
      $( "#begin_date_datepicker" ).datepicker();
    },

    createNewVideo: function (issue) {
      var video_id = "//www.youtube.com/embed/" + this.get('video_id');
      var title = this.get('title');
      var caption = this.get('caption');
      var position = this.get('content.posts').get('length') + 1;
      
      var post = this.store.createRecord('post', {
        position: position,
        issue: issue
      });
      post.save();
    
      var video = this.store.createRecord('video', {
        video_id: video_id,
        title: title,
        caption: caption,
        post: post
      });

      this.set('video_id', '');
      alert(video_id);
      video.save();  
    },

    createNewEvent: function (issue) {
      // Get the todo title set by the "New Todo" text field
      var top_image = this.get('top_image');
      var event_name = this.get('event_name');
      var description = this.get('description');
      var location = this.get('location');
      var contact_name = this.get('contact_name');
      var contact_info = this.get('contact_info');
      var position = this.get('content.posts').get('length') + 1;
      
      var post = this.store.createRecord('post', {
        position: position,
        issue: issue
      });
      post.save();
    
      var event = this.store.createRecord('event', {
        top_image: top_image,
        event_name: event_name,
        description: description,
        location: location,
        contact_name: contact_name,
        contact_info: contact_info,
        post: post
      });

      this.set('event_name', '');
      this.set('description', '');
      this.set('location', '');
      this.set('contact_name', '');
      this.set('contact_info', '');

      event.save();  
    },

    createNewArticle: function (issue) {
      // Get the todo title set by the "New Todo" text field
      var title = this.get('article_title');
      var author = this.get('author');
      var article_text = this.get('article_text');
      var position = this.get('content.posts').get('length') + 1;
  
      var post = this.store.createRecord('post', {
        position: position,
        issue: issue
      });
      post.save();
    
      var article = this.store.createRecord('article', {
        title: title,
        author: author,
        body: article_text,
        post: post
      });

      this.set('article_title', '');
      this.set('author', '');
      this.set('article_text', '');

      article.save(); 
    },
  },

    posts: (function() {
        return Ember.ArrayProxy.createWithMixins(Ember.SortableMixin, {
          content: this.get('content.posts'),
          sortProperties: ['position'],
          sortAscending: true          
        })
      }).property('content.posts'),

    updateSortOrder: function(indexes) {
      this.get('content.posts').beginPropertyChanges();
      this.get('content.posts').forEach(function(item) {
        var index = indexes[item.get('id')];
        item.set('position', index + 1);
      }, this);
      this.endPropertyChanges();
    }
});

App.IssueSummaryController = Ember.ObjectController.extend({
  needs: ["newsletter", "issue", "article", "post"]
});







App.NewsletterController = Ember.ObjectController.extend({
});

App.IssuesController = Ember.ArrayController.extend({
});

App.ArticleController = Ember.ArrayController.extend({
});

App.EventController = Ember.ArrayController.extend({
});

App.VideoController = Ember.ArrayController.extend({
});


App.PostController = Ember.ArrayController.extend({
  sortProperties: ['position'],
  sortAscending: true
});



App.IssueView = Ember.View.extend({
  sortProperties: ['position'],

  didInsertElement: function() {
    var controller = this.get('controller');
    this.$(".sortable").sortable({
      update: function(event, ui) {
        var indexes = {};

        $(this).find('.post').each(function(index) {
          indexes[$(this).data('id')] = index;
        });

        $(this).sortable('cancel');

        controller.updateSortOrder(indexes);
      }
    });
  }
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
  posts: DS.hasMany('post')
});

App.Article = DS.Model.extend({
  author: DS.attr('string'),
  title: DS.attr('string'),
  body: DS.attr('string'),
  post: DS.belongsTo('post')
});

App.Event = DS.Model.extend({
  event_name: DS.attr('string'),
  description: DS.attr('string'),
  location: DS.attr('string'),
  contact_name: DS.attr('string'),
  contact_info: DS.attr('string'),
  post: DS.belongsTo('post')
});

App.Video = DS.Model.extend({
  title: DS.attr('string'),
  caption: DS.attr('string'),
  video_id: DS.attr('string'),
  post: DS.belongsTo('post')
});


App.Post = DS.Model.extend({
  position: DS.attr('number'),
  article: DS.belongsTo('article'),
  event: DS.belongsTo('event'),
  video: DS.belongsTo('video'),
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

App.Post.FIXTURES = [{
  id: 1
}
]

App.Event.FIXTURES = [
{
      id: 1
} 
]

App.Video.FIXTURES = [
{
      id: 1
} 
]