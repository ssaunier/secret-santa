'use strict'

angular.module('secretSantaApp')
  .controller 'RecipientCtrl',  ($scope, recipientStorage) ->
    $scope.recipients = recipientStorage.get()
    $scope.newRecipient = ''

    $scope.$watch 'recipients', ((newValue, oldValue) ->
      if newValue != oldValue
        recipientStorage.put($scope.recipients)
      ), true

    $scope.addRecipient = () ->
      newRecipient = $scope.newRecipient.trim()
      return unless newRecipient.length
      $scope.recipients.push newRecipient
      $scope.newRecipient = ''

    $scope.removeRecipient = (recipient) ->
      $scope.recipients.splice($scope.recipients.indexOf(recipient), 1)
