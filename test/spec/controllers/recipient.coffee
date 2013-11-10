'use strict'

describe 'Controller: RecipientCtrl', () ->

  # load the controller's module
  beforeEach module 'secretSantaApp'

  RecipientCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RecipientCtrl = $controller 'RecipientCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
