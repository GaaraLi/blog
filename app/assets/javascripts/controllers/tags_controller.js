// Controller for all tag
Blog.TagsController = Ember.ObjectController.extend({
  actions: {
    new: function() {
      var tagName = this.get('newTag');
      if (!tagName.trim()) {return;}

      var tag = this.store.createRecord('tag',{
        name: tagName
      });

      this.set('newTag', '');

      tag.save();
    }
  }
})