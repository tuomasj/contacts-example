
class @Contact extends Backbone.Model
  defaults:
    "name": "unknown"
    "phonenumber": "000"

class @Contacts extends Backbone.Collection
  model: @Contact

