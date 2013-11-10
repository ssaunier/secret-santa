'use strict'

angular.module('secretSantaApp')
  .factory 'RecipientStorage', () ->
    STORAGE_ID = 'secret-santa-recipients';

    {
      get: () ->
        JSON.parse(localStorage.getItem(STORAGE_ID) || '[]')
      put: (recipients) ->
        localStorage.setItem(STORAGE_ID, JSON.stringify(recipients))
      names: (recipients) ->
        recipient.name for recipient in recipients
      index: (recipient, recipients) ->
        this.names(recipients).indexOf(recipient)
      possibleTos: (from, recipients) ->
        possibleTos = this.names(recipients)
        possibleTos.splice(possibleTos.indexOf(from.name), 1)[0] # Cannot give a gift to yourself :p
        for constraint in from.constraints
          possibleTos.splice(possibleTos.indexOf(constraint), 1)
        possibleTos
    }
