$(document).ready(function () {

    function toggleChatPanel() {
        $('.friend-list').toggle();
        $('#toggleChatPannel > a > i').toggleClass("fa-comments-o");
        $('#toggleChatPannel > a > i').toggleClass("fa-comments");
    }

    function toggleChatRoom() {
        $('.chat-content, .chat-input-div').toggle();
        $('.chat-popup').toggleClass("chat-small");
        $('.chat-header').toggleClass("chat-off");
    }

    function displayUserChat() {
        $('.chat-popup, .chat-content, .chat-input-div').show();
        $('.chat-popup').removeClass("chat-small");
        $('.chat-header').removeClass("chat-off");
        if ($(this).data("name") != "") {
            $username = $(this).data("name");
            $('.chat-user-name').html($username);
        }
        $('.chat-input-div input').attr('data-id', $(this).data('id'))
                                    .attr('data-name', $(this).data('name'))
                                    .focus();
    }

    // Troncate username if too big
    $('.chat-user-name').truncate({
        lines: 1,
        lineHeight: 26
    });

    $('.friend_name-chat-list').truncate({
        lines: 1,
        lineHeight: 20
    });


    // toggle Chat panel on right side of the screen (friend list)
    $('#toggleChatPannel').click(toggleChatPanel);

    // Display/hide Windows of ChatRoom when you click on userName
    $('.chat-user-name').click(toggleChatRoom);
    $('.user-name-friend-list').click(displayUserChat);

    // Blink chat-header when u click on username multiple times
    $('.user-name-friend-list').mousedown(function () {
        if ($('.chat-user-name').is(":visible"))
            $('.chat-header').addClass("highlight");
    });
    $('.user-name-friend-list').mouseup(function () {
        if ($('.chat-user-name').is(":visible"))
            $('.chat-header').removeClass("highlight");
    });

    // Close Windows when click on cross
    $('.chat-header .close').on('click', function () {
        $('.chat-popup').hide();
    });

});