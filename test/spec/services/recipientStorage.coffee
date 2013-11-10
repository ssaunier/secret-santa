'use strict'

describe 'Service: Recipientstorage', () ->

  # load the service's module
  beforeEach module 'secretSantaApp'

  # instantiate service
  Recipientstorage = {}
  beforeEach inject (_Recipientstorage_) ->
    Recipientstorage = _Recipientstorage_

  it 'should do something', () ->
    expect(!!Recipientstorage).toBe true
