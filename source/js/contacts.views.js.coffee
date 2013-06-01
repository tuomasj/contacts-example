class @ShowContactsView extends Backbone.View
  initialize: ->
    @template = JST["templates/contacts"]

  events:
    "click .new-contact": "addNewContactClicked"

  render: ->
    @$el.html( @template( contacts: @collection.toJSON() ))
    return @

  addNewContactClicked: ->
    Backbone.history.navigate("contacts/new", true)

class @NewContactView extends Backbone.View
  initialize: (app) ->
    @template = JST["templates/newcontact"]

  events:
    "click .cancel": "cancelClicked"
    "submit form": "submitForm"
    "keyup input": "checkForm"

  render: ->
    @$el.html( @template() )
    return @

  cancelClicked:(ev) ->
    Backbone.history.navigate("contacts", true)
    ev.preventDefault()

  submitForm: (ev) ->
    ev.preventDefault()
    name = @$("input[name='name']").val()
    phonenumber = @$("input[name='phonenumber']").val()
    @collection.add( new Contact( name: name, phonenumber: phonenumber) )
    Backbone.history.navigate("contacts", true)

  checkForm: ->
    name = @$("input[name='name']").val()
    phonenumber = @$("input[name='phonenumber']").val()
    if name.length > 0 and phonenumber.length > 0
      @$("input[type='submit']").removeAttr('disabled')
    else
      @$("input[type='submit']").attr('disabled', 'disabled')



