# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :stages, %w(production)     #various environments
require 'capistrano/bundler'           # install all the new missing plugins...
require 'rvm/capistrano'                # if you are using rvm on your server..
require './config/boot'

# after "deploy:update", "deploy:cleanup" #clean up temp files etc.
# after "deploy:update_code","deploy:migrate"

set(:application) { "qracto" }
set :rvm_ruby_string, '2.3.3'             # ruby version you are using...
set :scm_runner, :in => :groups, :limit => 10, :wait => 3
set :scm_username, "namits"

set :scm_password, "Naimish@qwertyuiop"
set :user, "root"
# set :rvm_type, :user
set (:deploy_to) { "/home/#{application}/#{stage}" }
set :tmp_dir, "/home"
set :keep_releases, 5
set :repository, "https://github.com/namits/qracto.git"
set :use_sudo, false
set :scm, :git
# ssh_options[:forward_agent] = true
# default_run_options[:pty] = true
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1

namespace :deploy do

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command do
      roles(:app) do
        run "/etc/init.d/unicorn_#{application} #{command}"
      end
    end
  end

  desc 'Congifure symlinks like database.yml'
  task :config_symlink do
    run "ln -sf #{shared_path}/database.yml #{release_path}/config/database.yml"
  end

  task :setup_config do
    roles(:app) do
      # sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
      sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
      run "mkdir -p #{shared_path}/config"
      puts "Now edit the config files in #{shared_path}."
    end
  end

  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    roles(:web) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts 'WARNING: HEAD is not the same as origin/master'
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end
  before 'deploy', 'deploy:check_revision'
end