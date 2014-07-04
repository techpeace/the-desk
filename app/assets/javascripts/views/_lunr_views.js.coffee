ResultView = Backbone.View.extend
  template: _.template($('.standard-view').html())
  className: () ->
    return 'standard-row r' + @model.get('id')
  initialize: (options) ->
  render: (options) ->
    @$el.html(@template(@model.toJSON()))
    this;

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
    @childViews = []
  newEntry: (newModel) ->
    @lunr.add(newModel.toJSON())
    standardView = new ResultView({
      model: newModel
    })
    newModel.view = standardView
    @$('.standards-results').prepend(standardView.render().el)
    @childViews.push(standardView);
  searchLunr: _.debounce((e) ->
    text = $(e.target).val()
    if text
      @$('.standards-results').addClass('searching')
      @filterStandards(@lunr.search(text))
    else
      @$('.standards-results').removeClass('searching')
  , 150)
  filterStandards: (results) ->
    ids = []
    results.forEach((result) ->
      ids.push(result.ref)
    )
    @resetResults(ids)
  resetResults: (ids) ->
    console.log(ids)
    @$('.standards-results').removeClass().addClass('standards-results searching r' + ids.join(' r'))

