window.DeliveryModel = Backbone.Model.extend {}

window.DeliveryCollection = Backbone.Collection.extend {
  model: DeliveryModel
  initialize: (array, options) ->
    @url = options.url
    @comparator = "date"
}