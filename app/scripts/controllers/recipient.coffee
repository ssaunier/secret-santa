'use strict'

angular.module('secretSantaApp')
  .controller 'RecipientCtrl',  ($scope, $rootScope, RecipientStorage) ->
    $scope.recipients = RecipientStorage.get()
    $scope.newRecipient = ''

    $scope.$watch 'recipients', ((newValue, oldValue) ->
      if newValue != oldValue
        RecipientStorage.put $scope.recipients.sort (a, b) ->
          a.name > b.name ? 1 : -1
        $rootScope.$emit('recipients:changed')
      ), true

    $scope.addRecipient = () ->
      newRecipient = $scope.newRecipient.trim()
      return unless newRecipient.length
      return if $scope.isDuplicate(newRecipient)
      $scope.recipients.push
        name: newRecipient,
        constraints: []
      $scope.newRecipient = ''

    $scope.removeRecipient = (recipient) ->
      $scope.recipients.splice($scope.recipients.indexOf(recipient), 1)

    $scope.isDuplicate = (newRecipient) ->
      newRecipient in RecipientStorage.names($scope.recipients)