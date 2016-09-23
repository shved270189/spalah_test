namespace :users do
  desc 'Greating for users'
  task greeting: :environment do
    puts 'Hello, User!'
  end
end
