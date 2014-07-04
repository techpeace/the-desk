SearchModel = Backbone.Model.extend {}

window.SearchCollection = Backbone.Collection.extend {
  initialize: (options) ->
    @url = options.url
  model: SearchModel
  comparator: 'key'
}