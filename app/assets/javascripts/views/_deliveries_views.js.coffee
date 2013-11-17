window.DeliveriesView = Backbone.View.extend { 
  initialize: (options) ->
    self = this
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
    @templateGen = _.getTemplate('delivery-link')
    @listenTo(this.model, "remove", @removeFromView)

  events: 
    "click .destroy-link": "destroyDate"
  
  render: ->
    newHtml = this.templateGen(@model.toJSON())
    $(@el).html(newHtml)

  destroyDate: (e) ->
    e.preventDefault()
    @model.destroy()

  removeFromView: ->
    console.log("die")
    $(@el).remove()
}