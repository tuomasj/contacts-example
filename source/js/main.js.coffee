#= require 'vendor/jquery-1.8.0.min.js'
#= require 'vendor/underscore.min.js'
#= require 'vendor/backbone.min.js'
#= require 'plugins.js'

#= require_tree "./templates"
#= require 'contacts.routers.js'

$ ->
  new ContactsRouter()
  Backbone.history.start()
