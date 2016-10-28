import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'tr',

  normalData: Ember.computed('post.created_at', function() {
    return new Date(this.get('post.created_at') * 1000);
  })
});
