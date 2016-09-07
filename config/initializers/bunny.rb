class RmqQueues
  include Singleton

  def initialize
    conn = Bunny.new
    conn.start
    @channel = conn.create_channel
  end

  def publish_comment(comment)
    exchange.publish(comment.to_json, routing_key: queue_comments.name)
  end

  private

  def queue_comments
    @queue_comments ||= @channel.queue('comments', auto_delete: true)
  end

  def exchange
    @exchange_comments ||= @channel.default_exchange
  end
end
