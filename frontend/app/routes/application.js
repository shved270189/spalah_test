import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    // return Ember.$.get('/api/posts');
    return this.get('store').findAll('post');
  }
});
