require 'bundler/capistrano' # for bundler support

<<<<<<< HEAD
set :application, "Meetup-Project"
set :repository,  "git@github.com:stevenabrooks/playlister-rails.git"

set :user, 'stevenabrooks'
set :deploy_to, "/home/#{ user }/#{ application }"
=======
set :application, "playlister-rails"
set :repository,  "git@github.com:gglin/playlister-rails.git"

set :user, "gglin"
set :deploy_to, "/home/#{user}/#{application}"
>>>>>>> 2d1dbc6ffd6e6ba4814241c0cfd3cdbcb407dbbb
set :use_sudo, false

set :scm, :git

default_run_options[:pty] = true

<<<<<<< HEAD
role :web, "198.211.98.18"                          # Your HTTP server, Apache/etc
role :app, "198.211.98.18"                          # This may be the same as your `Web` server
=======
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "198.211.113.121"                          # Your HTTP server, Apache/etc
role :app, "198.211.113.121"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"
>>>>>>> 2d1dbc6ffd6e6ba4814241c0cfd3cdbcb407dbbb

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
<<<<<<< HEAD
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
=======
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
>>>>>>> 2d1dbc6ffd6e6ba4814241c0cfd3cdbcb407dbbb
end