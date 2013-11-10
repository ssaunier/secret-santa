'use strict'

describe 'Service: RecipientStorage', () ->

  # load the service's module
  beforeEach module 'secretSantaApp'

  # instantiate service
  RecipientStorage = {}
  beforeEach inject (_RecipientStorage_) ->
    RecipientStorage = _RecipientStorage_

  it 'should do something', () ->
    expect(!!RecipientStorage).toBe true
