ResultView = Backbone.View.extend
  initialize: (options) ->

window.LunrView = Backbone.View.extend
  events: {
    'keyup #lesson_standard_standard_id': 'searchLunr'
  }
  el: $('.standards-view')
  lunr: lunr(() ->
    @field('text')
  )
  initialize: (options) ->
    @listenTo(@collection, 'add', @newEntry)
  newEntry: (newModel) ->
    @lunr.add(newModel.toJSON())
  searchLunr: _.debounce((e) ->
    text = $(e.target).val()
    console.log(@lunr.search(text))
  , 150)