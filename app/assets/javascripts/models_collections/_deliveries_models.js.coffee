window.DeliveryModel = Backbone.Model.extend {}

window.DeliveryCollection = Backbone.Collection.extend {
  model: DeliveryModel
  initialize: (array, options) ->
    this.url = options.url
    this.comparator = "date"
}