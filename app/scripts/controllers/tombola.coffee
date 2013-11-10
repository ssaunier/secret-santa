'use strict'

angular.module('secretSantaApp')
  .controller 'TombolaCtrl', ($scope, RecipientStorage) ->
    recipients = RecipientStorage.get()
    $scope.drawnRecipients = []

    rollIndex = (size) ->
      Math.floor(Math.random() * size)

    shuffle = (a) ->
      for i in [a.length-1..1]
        j = Math.floor Math.random() * (i + 1)
        [a[i], a[j]] = [a[j], a[i]]
      a

    draw = (recipients) ->
      people = shuffle recipients.slice(0)
      count = people.length
      redraw = false
      for recipient in recipients
        recipient.possibleTos = RecipientStorage.possibleTos(recipient, people)

      assigendRecipients = []
      for recipient in people
        from = recipient
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

      if redraw then draw(recipients) else people

    $scope.runSecretSanta = () ->
      $scope.drawnRecipients = draw(recipients)