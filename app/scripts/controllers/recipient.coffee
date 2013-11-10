'use strict'

angular.module('secretSantaApp')
  .controller 'RecipientCtrl',  ($scope, RecipientStorage) ->
    $scope.recipients = RecipientStorage.get()
    $scope.newRecipient = ''

    $scope.$watch 'recipients', ((newValue, oldValue) ->
      if newValue != oldValue
        RecipientStorage.put($scope.recipients)
      ), true

    $scope.addRecipient = () ->
      newRecipient = $scope.newRecipient.trim()
      return unless newRecipient.length
      return if newRecipient in $scope.recipients
      $scope.recipients.push newRecipient
      $scope.newRecipient = ''

    $scope.removeRecipient = (recipient) ->
      $scope.recipients.splice($scope.recipients.indexOf(recipient), 1)

    $scope.isDuplicate = (newRecipient) ->
      newRecipient in $scope.recipients