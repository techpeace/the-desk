window.DeliveriesView = Backbone.View.extend { 
  initialize: (options) ->
    this.views = []
    this.listenTo(this.collection, "add", this.addDelivery)

  addDelivery: (newModel) ->
    newDelivery = new DeliveryView 
      model: newModel
    
    position = this.collection.indexOf(newModel)

    if position == 0
      $(this.el).prepend(newDelivery.el)
      @views.splice(0,0, newDelivery)
    else
      $(this.views[position-1].el).after(newDelivery.el)
      @views.splice(position, 0, newDelivery)

    newDelivery.render()
}

window.DeliveryView = Backbone.View.extend {
  initialize: (options) ->
    @templateGen = _.getTemplate('delivery-link')
    @listenTo(this.model, "remove", @removeFromView)

  events: 
    "click .destroy-link": "destroyDate"
  
  render: ->
    newHtml = this.templateGen({ date: moment(@model.get("date")).format("MMM DD, YYYY") })
    $(@el).html(newHtml)

  destroyDate: (e) ->
    e.preventDefault()
    @model.destroy()

  removeFromView: ->
    $(@el).remove()
}