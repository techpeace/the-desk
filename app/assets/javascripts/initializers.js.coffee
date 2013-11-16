window.init = {
  deliveries: (deliveries, url) ->
    window.deliveriesCollection = new DeliveryCollection [], {
      url: url
    }

    mainView = new DeliveriesView {
      el: $(".delivery-dates"),
      collection: deliveriesCollection
    }

    for deliver in deliveries
      if deliver.date
        deliveriesCollection.add(delivery)
}