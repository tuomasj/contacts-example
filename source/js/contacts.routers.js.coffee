#= require 'contacts.models.js'
#= require 'contacts.views.js'

# Using AppView-method for handling zombie views
# read more: http://lostechies.com/derickbailey/2011/09/15/zombies-run-managing-page-transitions-in-backbone-apps/
Backbone.View::close = ->
  @remove()
  @unbind()
  if @onClose
    @onClose()

class @AppView
  showView: (view) ->
    if @currentView?
      @currentView.close()
    @currentView = view
    @currentView.render()
    $('#content').html( @currentView.el )

class @ContactsRouter extends Backbone.Router
  initialize: ->
    @contacts = new Contacts()

    @contacts.add( new Contact( name: "Tuomas", phonenumber: "123-3456" )) 
    @contacts.add( new Contact( name: "Tommi", phonenumber: "555-5323" )) 
    @contacts.add( new Contact( name: "Olli", phonenumber: "878-0-3432" )) 
    @contacts.add( new Contact( name: "Florian", phonenumber: "500-404-200" )) 
    
    @appView = new AppView()

  routes:
    "contacts": "showContacts"
    "contacts/new": "newContact"

  showContacts: ->
    showContactsView = new ShowContactsView( collection: @contacts )
    @appView.showView( showContactsView )

  newContact: ->
    newContactView = new NewContactView( collection: @contacts )
    @appView.showView( newContactView )

  showOneContact: (params) ->
    showOneContactView = new ShowOneContactView( )
    @appView.showView( showContactsView )

