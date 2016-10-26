# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'spalah_app'
set :repo_url, 'git@gitlab.com:shved270189/spalah_test.git'

set :rvm_type, :user
set :rvm_ruby_version, '2.3.0'
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/spalah/spalah_app'

# set :unicorn_pid, "#{fetch deploy_to}/shared/pids/unicorn.pid"
set :unicorn_pid, -> { File.join(deploy_to, "shared", "pids", "unicorn.pid") }
set :unicorn_config_path, -> { File.join(current_path, "config", "unicorn.rb") }
#
# set :unicorn_conf, "#{fetch release_path}/config/unicorn.rb"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/facebook.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# after 'deploy:publishing', 'deploy:restart'
# namespace :deploy do
#   task :restart do
#     invoke 'unicorn:reload'
#   end
# end

# namespace :unicorn do
#   task :restart do
#     run "if [ -f #{fetch unicorn_pid} ] && [ -e /proc/$(cat #{fetch unicorn_pid}) ]; then kill -9 `cat #{fetch unicorn_pid}`; else cd #{fetch deploy_to}/current && bundle exec unicorn -c #{fetch unicorn_conf} -E #{fetch rails_env} -D; fi"
#   end
#   task :start do
#     on roles(:all) do |host|
#       within './current' do
#         execute "bundle exec unicorn -c #{fetch :unicorn_conf} -E #{fetch :rails_env} -D"
#       end
#     end
#   end
#   task :stop do
#     run "if [ -f #{fetch unicorn_pid} ] && [ -e /proc/$(cat #{fetch unicorn_pid}) ]; then kill -9 `cat #{fetch unicorn_pid}`; fi"
#   end
# end
