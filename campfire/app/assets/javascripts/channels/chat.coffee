App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    console.log "[CLIENT] [ChatChannel] Connected method"

  disconnected: ->
    console.log "[CLIENT] [ChatChannel] Connected method"

  received: (data) ->
    printMessage(data['message'], "receiver")
    displayChat(data)

  speak: (message, id) ->
    @perform 'speak', message: message, id: id
    printMessage(message, "sender")

  $(document).on 'keypress', '[data-input~=chat-input]', (event) ->
    if event.keyCode is 13
      App.chat.speak(event.target.value, $('.chat-input-div input').data('id'))
      event.target.value = ''
      event.preventDefault()

  displayChat = (data) ->
    $('.chat-popup, .chat-content, .chat-input-div').show()
    $('.chat-popup').removeClass("chat-small")
    $('.chat-header').removeClass("chat-off")
    $('.chat-user-name').html(data['name'])
    $('.chat-input-div input').attr('data-id', data['id'])
                              .attr('data-name', data['name'])
                              .focus()

  printMessage = (message, type) ->
    $('.chat-content').append("<div class='"+type+"-div'><span class='"+type+"'>"+message+"</span></div>")