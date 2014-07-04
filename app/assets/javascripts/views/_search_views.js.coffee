ResultView = Backbone.View.extend
  template: _.template($('.standard-view').html())
  className: () ->
    return 'standard-row r' + @model.get('id')
  initialize: (options) ->
  render: (options) ->
    @$el.html(@template(@model.toJSON()))
    this;

window.SearchView = Backbone.View.extend
  events: {
    'keyup #lesson_standard_standard_id': 'fuseSearch'
  }
  el: $('.standards-view')
  initialize: (options) ->
    @listenTo(@collection, 'reset', @fillIndex)
    @collection.fetch({reset: true})
    @childViews = []
  fillIndex: (collection) ->
    @fuse = new Fuse(collection.toJSON(),
      keys: ['text']
      id: 'id'
    )

    collection.each _.bind((model) ->
      standardView = new ResultView(
        model: model
      )
      @$('.standards-results').prepend(standardView.render().el)
      @childViews.push(standardView);
    , @)
  fuseSearch: _.debounce((e) ->
    text = $(e.target).val()
    if text
      @$('.standards-results').addClass('searching')
      @resetResults(@fuse.search(text))
    else
      @$('.standards-results').removeClass('searching')
  , 150)
  resetResults: (ids) ->
    @$('.standards-results').removeClass().addClass('standards-results searching r' + ids.join(' r'))

