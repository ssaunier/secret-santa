'use strict'

describe 'Controller: ConstraintCtrl', () ->

  # load the controller's module
  beforeEach module 'secretSantaApp'

  ConstraintCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ConstraintCtrl = $controller 'ConstraintCtrl', {
      $scope: scope
    }

  # it 'should attach a list of awesomeThings to the scope', () ->
  #   expect(scope.awesomeThings.length).toBe 3
