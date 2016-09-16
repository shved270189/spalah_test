class ChatJob < ApplicationJob
  queue_as :default

  def perform(*args)
    RmqQueues.instance.publish('new_comments', Comment.find(args[0]))
  end
end
