App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    console.log "[CLIENT] [NotificationChannel] Connected method"

  disconnected: ->
    console.log "[CLIENT] [NotificationChannel] Disconnected method"

  received: (data) ->
    $('#notification').prepend(data['notification'])