'use strict'

angular.module('secretSantaApp')
  .controller 'ConstraintCtrl', ($scope, $rootScope, RecipientStorage) ->
    $scope.recipients = RecipientStorage.get()
    $scope.newConstraintFrom = ''
    $scope.newConstraintTo = ''

    $rootScope.$on 'recipients:changed', () ->
      $scope.recipients = RecipientStorage.get()

    $scope.$watch 'recipients', ((newValue, oldValue) ->
      RecipientStorage.put($scope.recipients)
      ), true

    addConstraint = (from, to) ->
      index = RecipientStorage.index(from, $scope.recipients)
      return if index == -1
      return if to in $scope.recipients[index].constraints
      $scope.recipients[index].constraints.push to

    $scope.addConstraintWithOpposite = () ->
      return if !$scope.newConstraintFrom || !$scope.newConstraintTo
      return if $scope.newConstraintFrom == $scope.newConstraintTo

      addConstraint($scope.newConstraintFrom, $scope.newConstraintTo)
      if $scope.opposite
        addConstraint($scope.newConstraintTo, $scope.newConstraintFrom)

    $scope.removeConstraints = (recipient) ->
      $scope.recipients[$scope.recipients.indexOf(recipient)].constraints = []
