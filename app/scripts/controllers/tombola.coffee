'use strict'

angular.module('secretSantaApp')
  .controller 'TombolaCtrl', ($scope, $rootScope, RecipientStorage) ->
    $scope.recipients = RecipientStorage.get()
    $scope.drawnRecipients = []

    $rootScope.$on 'recipients:changed', () ->
      $scope.recipients = RecipientStorage.get()

    rollIndex = (size) ->
      Math.floor(Math.random() * size)

    shuffle = (a) ->
      for i in [a.length-1..1]
        j = Math.floor Math.random() * (i + 1)
        [a[i], a[j]] = [a[j], a[i]]
      a

    draw = () ->
      people = shuffle $scope.recipients.slice(0)
      count = people.length
      redraw = false
      for recipient in people
        recipient.possibleTos = RecipientStorage.possibleTos(recipient, people)

      assigendRecipients = []
      for from in people
        possibleTos = RecipientStorage.possibleTos(from, people)
        for assignedRecipient in assigendRecipients
          index = possibleTos.indexOf(assignedRecipient)
          possibleTos.splice(index, 1) if index != -1

        if possibleTos.length == 0
          redraw = true
          break

        to = possibleTos[rollIndex(possibleTos.length)]
        from.to = to
        assigendRecipients.push to

      if redraw then draw() else people

    $scope.runSecretSanta = () ->
      $scope.drawnRecipients = draw()