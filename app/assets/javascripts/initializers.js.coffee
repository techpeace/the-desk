window.init = {
  deliveries: (deliveries, url) ->
    console.log(url)
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
  calendar: (userId) ->
    $('#calendar').fullCalendar({
      events: 
        url: "/users/" + userId + "/calendars",
        type: "GET",
        cache: true
    })
}