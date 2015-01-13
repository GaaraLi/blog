#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require blog

# for more details see: http://emberjs.com/guides/application/
window.Blog = Ember.Application.create()
Blog.ApplicationAdapter = DS.ActiveModelAdapter.extend({
})
