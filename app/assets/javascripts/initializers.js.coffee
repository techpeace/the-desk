window.init = {
  deliveries: (deliveries, url) ->
    window.deliveriesCollection = new DeliveryCollection [], {
      url: url
    }

    mainView = new DeliveriesView {
      el: $(".delivery-dates")
      collection: deliveriesCollection
    }

    deliveriesCollection.add deliveries

  calendar: (calendarUrl) ->
    $('#calendar').fullCalendar({
      header:
        left: 'title',
        center: 'month,basicWeek'
        right: 'today prev,next'
      events:
        url: calendarUrl
        type: "GET"
        cache: true
    })
}