import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  created_at: DS.attr('date')
});
