selectedCollection = new (Backbone.Collection.extend
  model: Backbone.Model.extend()
)()

SelectedView = Backbone.View.extend
  template: _.template('<li><a href="#" class="destroy-link" data-model-id=\'{{ id }}\'><i class="fa fa-trash-o fa-fw"></i></a>&nbsp;&nbsp;&nbsp;{{ key }}</li>')
  events:
    'click a.destroy-link': 'removeStandard'
  removeStandard: (e) ->
    e.preventDefault()
    id = $(e.currentTarget).data('model-id')
    $(e.currentTarget).closest('li').remove()
    selectedCollection.remove(id)
  addStandard: (newModel) ->
    @$el.append(@template(newModel.toJSON()))

ResultView = Backbone.View.extend
  events:
    'click p': 'selectStandard'
  className: () ->
    return 'standard-row r' + @model.get('id')
  initialize: (options) ->
    @template = _.template($('.standard-view').html())
  render: (options) ->
    @$el.html(@template(@model.toJSON()))
    this;
  selectStandard: () ->
    json = this.model.toJSON()
    selectedCollection.add([json])
    @model.collection.remove(this.model)
    @remove()


window.SearchView = Backbone.View.extend
  events: {
    'keyup #lesson_standard_standard_id': 'fuseSearch'
    'click .submit-standards': 'submitStandards'
  }
  el: $('.standards-view')
  initialize: (options) ->
    @listenTo(@collection, 'reset', @fillIndex)
    @listenTo(selectedCollection, 'remove', @addBack)
    @collection.fetch({reset: true})
    @lessonId = options.lessonId
    selectedView = new SelectedView(
      el: options.selectedEl
    )
    selectedView.listenTo(selectedCollection, "add", selectedView.addStandard)
    selectedCollection.add(options.currentStandards)
  fillIndex: (collection) ->
    @fuse = new Fuse(collection.toJSON(),
      keys: ['text']
      id: 'id'
    )

    collection.each _.bind((model) ->
      standardView = new ResultView(
        model: model
      )
      model.view = standardView
      @$('.standards-results').prepend(standardView.render().el)
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
  addBack: (newModel) ->
    newModel = @collection.add(newModel.toJSON())
    standardView = new ResultView(
      model: newModel
    )
    newModel.view = standardView
    index = (@collection.indexOf(newModel) || 0) - 1;
    @collection.at(index).view.$el.before(standardView.render().el)
  submitStandards: (e) ->
    e.preventDefault()
    $.ajax(
      url: '/lessons/' + @lessonId + '/lesson_standards.json'
      method: "POST"
      data: {
        standardIds: selectedCollection.pluck('id')
      }
      success: (data) ->
        location.reload()
    )


