'use strict'

angular.module('secretSantaApp')
  .controller 'RecipientCtrl', ($scope) ->
    $scope.recipients = [
      'Sébastien'
      'Charlotte'
    ]
