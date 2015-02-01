Blog.Router.map(function() {
  // this.resource('admins', {path: '/' });
  this.resource('tags', {path: '/' });
  this.resource('articles');
});

// Blog.AdminsRoute = Ember.Route.extend({
//   setupController: function(controller, model) {
//     controller.set('tags', Blog.Tag.find(1) );
//   }
// });

Blog.ArticlesRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('article');
  }
});

Blog.TagsRoute = Ember.Route.extend({
  model: function() {
    return Ember.RSVP.hash({
      tags: this.store.find('tag'),
      articles: this.store.find('article')
    })
  }
});