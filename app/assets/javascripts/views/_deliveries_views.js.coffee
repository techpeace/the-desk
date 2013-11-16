window.DeliveriesView = Backbone.View.extend { 
  initialize: (options) ->
    this.listenTo(this.collection, "add", this.addDelivery)

  addDelivery: (newModel) ->
    newDelivery = new DeliveryView {
      model: newModel
    }
    $(this.el).prepend(newDelivery.el)

    newDelivery.render()

}

window.DeliveryView = Backbone.View.extend {
  initialize: (options) ->
    this.templateGen = _.getTemplate('delivery-link')

  render: ->
    newHtml = this.templateGen(this.model.toJSON())
    $(this.el).html(newHtml)
}