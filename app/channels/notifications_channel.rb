class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications:#{@user.id}"
  end

  def unsubscribed
  end
end
