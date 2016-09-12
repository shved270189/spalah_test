class CommentObserver < ActiveRecord::Observer
  # def after_create(comment)
  #   RmqQueues.instance.publish('new_comments', comment)
  #   # Pusher.trigger('comments', 'new', comment.as_json)
  # end
end
