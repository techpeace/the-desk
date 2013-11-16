window.DeliveriesView = Backbone.View.extend { 
  initialize: (options) ->
    this.listenTo(this.collection, "add", this.addDelivery)

  addDelivery: (newModel) ->
    newDelivery = new DeliveryView {
      model: newModel
    }
    $(this.el).prepend(newDelivery.el)

}

window.DeliveryView = Backbone.View.extend {

}