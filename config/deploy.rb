require 'bundler/capistrano' # for bundler support

set :application, "Meetup-Project"
set :repository,  "git@github.com:stevenabrooks/playlister-rails.git"

set :user, 'stevenabrooks'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git

default_run_options[:pty] = true

role :web, "198.211.98.18"                          # Your HTTP server, Apache/etc
role :app, "198.211.98.18"                          # This may be the same as your `Web` server

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end