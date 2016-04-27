App.notif_counter = App.cable.subscriptions.create "NotifCounterChannel",
  connected: ->
    console.log "[CLIENT] [NotifCounterChannel] Connected method"

  disconnected: ->
    console.log "[CLIENT] [NotifCounterChannel] Connected method"

  received: (data) ->
    $("#notification-counter").html(data)