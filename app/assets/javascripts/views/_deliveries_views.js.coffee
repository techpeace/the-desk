window.DeliveriesView = Backbone.View.extend { 
  initialize: (options) ->
    @views = []
    @listenTo(@collection, "add", @addDelivery)

  addDelivery: (newModel) ->
    newDelivery = new DeliveryView 
      model: newModel
    
    position = @collection.indexOf(newModel)

    if position == 0
      $(@el).prepend(newDelivery.el)
      @views.splice(0,0, newDelivery)
    else
      $(@views[position-1].el).after(newDelivery.el)
      @views.splice(position, 0, newDelivery)

    newDelivery.render()
}

window.DeliveryView = Backbone.View.extend {
  tagName: "li"
  
  initialize: (options) ->
    @templateGen = _.getTemplate('delivery-link')
    @listenTo(@model, "remove", @removeFromView)

  events: 
    "click .destroy-link": "destroyDate"
  
  render: ->
    newHtml = @templateGen({ date: moment(@model.get("date")).format("MMM DD, YYYY") })
    $(@el).html(newHtml)

  destroyDate: (e) ->
    e.preventDefault()
    @model.destroy()

  removeFromView: ->
    $(@el).remove()
}