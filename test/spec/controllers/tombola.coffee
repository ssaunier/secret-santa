'use strict'

describe 'Controller: TombolaCtrl', () ->

  # load the controller's module
  beforeEach module 'secretSantaApp'

  TombolaCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TombolaCtrl = $controller 'TombolaCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
