_.templateSettings.interpolate = /\{\{(.+?)\}\}/g

# Add our own utility functions to underscore
_.mixin
  getTemplate: (name) -> _.template $('#templates .' + name).html()

# Activate any select2 drop downs
$('.with-select2').select2()
