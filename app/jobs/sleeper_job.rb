class SleeperJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'START'
    sleep 20
    puts 'END'
  end
end
