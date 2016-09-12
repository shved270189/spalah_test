class RmqQueues
  include Singleton

  def initialize
    conn = Bunny.new
    conn.start
    @channel = conn.create_channel
  end

  def publish(channel_name, data)
    payload = {
      channel: channel_name,
      data: data
    }
    exchange.publish(payload.to_json, routing_key: queue.name)
  end

  private

  def queue
    @queue ||= @channel.queue('notifications', auto_delete: true)
  end

  def exchange
    @exchange ||= @channel.default_exchange
  end
end
