CKEDITOR.editorConfig = (config) ->
  config.toolbar = [
    {
      name: 'document'
      items: [
        'Save'
      ]
    }
    {
      name: 'basicstyles'
      items: [
        'Bold'
        'Italic'
        '-'
        'RemoveFormat'
      ]
    }
    {
      name: 'paragraph'
      items: [
        'NumberedList'
        'BulletedList'
        '-'
        'BlockQuote'
      ]
    }
    {
      name: 'links'
      items: [
        'Link'
        'Unlink'
      ]
    }
    {
      name: 'tools'
      items: [
        'Format'
      ]
    }
    {
      name: 'clipboard'
      items: [
        'Cut'
        'Copy'
        'Paste'
        'PasteText'
        'PasteFromWord'
        '-'
        'Undo'
        'Redo'
      ]
    }
    {
      name: 'editing'
      items: [
        'Find'
        'Replace'
        'SelectAll'
        'Scayt'
      ]
    }
    {
      name: 'others'
      items: [
        'Maximize'
      ]
    }
  ]