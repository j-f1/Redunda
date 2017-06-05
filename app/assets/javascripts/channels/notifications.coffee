App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    Notification.requestPermission().then (permission) ->
      return unless permission == 'granted'
      notification = new Notification data.title, data.options
