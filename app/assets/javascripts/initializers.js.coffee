window.init = {
  deliveries: (deliveries, url) ->
    window.deliveriesCollection = new DeliveryCollection [], {
      url: url
    }

    mainView = new DeliveriesView {
      el: $(".delivery-dates")
      collection: deliveriesCollection
    }

    for deliver in deliveries
      if deliver.date
        deliveriesCollection.add(delivery)

  calendar: (userId) ->
    $('#calendar').fullCalendar({
      header:
        left: 'title',
        center: 'month,basicWeek'
        right: 'today prev,next'
      events:
        url: "/users/" + userId + "/calendars"
        type: "GET"
        cache: true
    })
}