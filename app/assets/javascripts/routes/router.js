Blog.Router.map(function() {
  this.resource('articles', {path: '/' });
  this.resource('tags', {path: '/' });
});

Blog.ArticlesRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('article');
  }
});

Blog.TagsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('tag');
  }
});