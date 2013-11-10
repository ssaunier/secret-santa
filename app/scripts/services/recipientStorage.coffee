'use strict'

angular.module('secretSantaApp')
  .factory 'RecipientStorage', () ->
    STORAGE_ID = 'secret-santa-recipients';

    {
      get: () ->
        JSON.parse(localStorage.getItem(STORAGE_ID) || '[]')
      put: (recipients) ->
        localStorage.setItem(STORAGE_ID, JSON.stringify(recipients))
    }