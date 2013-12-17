App = Ember.Application.create();

App.ApplicationAdapter = DS.FixtureAdapter.extend();

App.Router.map(function() {
  this.resource('issues', function() {
    this.resource('issue', {path: ":issue_id"}, function() {
        this.resource('articles', function() {
          this.resource('article', {path: ":article_id"});
        });

        this.resource('events', function() {
          this.resource('event', {path: ":event_id"});
        });

        this.resource('videos', function() {
          this.resource('video', {path: ":video_id"});
        });

        this.route('summary');
        this.route('edit_issue_name');
        this.route('add_article');
        this.route('add_event');
        this.route('preview');
    });
  });
});

App.ApplicationRoute = Ember.Route.extend({
  setupController: function(controller,model) {
        controller.set('model', model);
        this.controllerFor('organization').set('model', this.store.find('organization', 1));
        this.controllerFor('newsletter').set('model', this.store.find('newsletter', 1));
  }
});


App.IssuesRoute = Ember.Route.extend({
  setupController: function(controller,model) {
        controller.set('model', model);
        this.controllerFor('organization').set('model', this.store.find('organization', 1));
        this.controllerFor('newsletter').set('model', this.store.find('newsletter', 1));
        this.controllerFor('article').set('model',this.store.find('article'));
        this.controllerFor('post').set('model', this.store.find('post'));
        this.controllerFor('article').set('model',this.store.find('article'));
        this.controllerFor('event').set('model',this.store.find('event'));
        this.controllerFor('video').set('model',this.store.find('video'));
  },

  model: function () {
    return this.store.find('issue');
  }
});


App.IssueRoute = Ember.Route.extend({
  setupController: function(controller,model) {
        controller.set('model', model);
        this.controllerFor('post').set('model', this.store.find('post'));
        this.controllerFor('article').set('model',this.store.find('article'));
        this.controllerFor('event').set('model',this.store.find('event'));
        this.controllerFor('video').set('model',this.store.find('video'));
  },

  model: function(params) {
    return this.store.findBy('id', params.issue_id);
  }
});

App.ArticlesRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('article');
  }
});

App.ArticleRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.findBy('id', params.article_id);
  }
});

App.EventsRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('event');
  }
});

App.EventRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.findBy('id', params.event_id);
  }
});

App.VideosRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('event');
  }
});

App.VideoRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.findBy('id', params.video_id);
  }
});




App.ApplicationController = Ember.ObjectController.extend({
  needs: ["newsletter", "issues", "issue", "post"],

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

    triggerNewIssuePopover: function () {
      $("#create_new_issue_popover").removeClass("hide");
    },

    createNewIssue: function (info) {
      $("#create_new_issue_popover").addClass("hide");
      var draft_name = this.get('draft_name');
      var issue = this.store.createRecord('issue', {
        draft_name: draft_name
      });

      issue.save();
      this.set('draft_name', '');
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

    prepareModal: function() {
      Galleria.run('.galleria', {responsive:true,height:0.5625});
    },

    startDatepicking: function() {
      $( "#end_date_datepicker" ).datepicker();
      $( "#begin_date_datepicker" ).datepicker();
    },

    uploadImage: function(issue) {
      var controller_with_context = this;
      var options = { 
        success: function(data) {
          controller_with_context.send('createNewArticle', issue, data);
        },
        dataType: 'json'  
      }; 
      var form = $('#article_form').ajaxSubmit(options);
    },

    createNewVideo: function (issue) {


      var video_id = "//www.youtube.com/embed/" + this.get('video_id') + "?enablejsapi&wmode=opaque";
      var title = this.get('title');
      var caption = this.get('caption');
      var position = this.get('content.posts').get('length') + 1;
      
      var post = this.store.createRecord('post', {
        position: position,
        issue: issue
      });
      post.save();
    
      var video = this.store.createRecord('video', {
        embedded_video_id: video_id,
        title: title,
        caption: caption,
        post: post
      });

      this.set('video_id', '');
      video.save();  
    },

    createNewEvent: function (issue) {
      // Get the todo title set by the "New Todo" text field
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

      var store = this.store;

      
     

      var event = this.store.createRecord('event', {
        top_image: top_image,
        event_name: event_name,
        description: description,
        location: location,
        contact_name: contact_name,
        contact_info: contact_info,
        post: post
      });

      event.save(); 

      this.set('event_name', '');
      this.set('description', '');
      this.set('location', '');
      this.set('contact_name', '');
      this.set('contact_info', '');

      
    },

    createNewArticle: function (issue, data) {
      var title = this.get('title');
      var author = this.get('author');
      var body = this.get('body');
      var top_image = data.top_image.top_image.padded.url;
      var position = this.get('content.posts').get('length') + 1;

      var post = this.store.createRecord('post', {
        position: position,
        issue: issue
      });
      post.save();
      
      var article = this.store.createRecord('article', {
        title: title,
        author: author,
        body: body,
        top_image: top_image, 
        post: post
      });

      this.set('title', '');
      this.set('author', '');
      this.set('body', '');

      article.save();
      $('#add_article').modal('hide');
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


App.NewsletterController = Ember.ObjectController.extend({
});

App.IssuesController = Ember.ArrayController.extend({
  needs: ["issues"],
});


App.ArticlesController = Ember.ArrayController.extend({
});

App.ArticleController = Ember.ObjectController.extend({
  actions: {
    updateArticle: function (issue, data) {
      var title = this.get('title');
      var author = this.get('author');
      var body = this.get('body');
      //var top_image = data.top_image.top_image.padded.url;
      

      var article = this.get('model');
      article.set('title', title);
      article.set('author', author);
      article.set('body', body);

      article.save(); 
      
      this.transitionToRoute('issue');
    },
  }
});

App.EventsController = Ember.ArrayController.extend({
  
});

App.EventController = Ember.ObjectController.extend({
  actions: {
    updateEvent: function (issue, data) {
      var event_name = this.get('event_name');
      var description = this.get('description');
      var location = this.get('location');
      var contact_name = this.get('contact_name');
      var contact_info = this.get('contact_info');
      

      var event = this.get('model');
      event.set('event_name', event_name);
      event.set('description', description);
      event.set('location', location);
      event.set('contact_name', contact_name);
      event.set('contact_info', contact_info);

      event.save(); 
     
      this.transitionTo('issue');
    },
  }
});

App.VideosController = Ember.ArrayController.extend({
});




App.VideoController = Ember.ObjectController.extend({
  actions: {
    updateVideo: function (issue, data) {
      var embedded_video_id = this.get('embedded_video_id');
      var title = this.get('title');
      var caption = this.get('caption');
     
      var video = this.get('model');
      video.set('embedded_video_id', embedded_video_id);
      video.set('title', title);
      video.set('caption', caption);

      video.save(); 
     
      this.transitionToRoute('issue');
    },
  }
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




App.ArticleView = Ember.View.extend({
  didInsertElement: function() {
    $(".centered").hide();
    $(".summary").hide();
    
  },
  willDestroyElement: function() {
    $(".centered").show();
    $(".summary").show();
  },

});

App.EventView = Ember.View.extend({
  didInsertElement: function() {
    $(".centered").hide();
    $(".summary").hide();
  },
  willDestroyElement: function() {
    $(".centered").show();
    $(".summary").show();
  },

});

App.VideoView = Ember.View.extend({
  didInsertElement: function() {
    $(".centered").hide();
    $(".summary").hide();
  },
  willDestroyElement: function() {
    $(".centered").show();
    $(".summary").show();
  },

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
  top_image: DS.attr('string'),
  post: DS.belongsTo('post'),
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
  embedded_video_id: DS.attr('string'),
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
   id:1,
   draft_name: "issue #1"
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