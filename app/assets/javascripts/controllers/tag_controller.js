Blog.TagController = Ember.ObjectController.extend({
  actions: {
    remove: function(){
      var tag = this.get('model');
      tag.deleteRecord();
      tag.save();
    },
    new: function() {
      var tag = this
    }
  }
})