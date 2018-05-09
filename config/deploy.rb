# config valid for current version and patch releases of Capistrano
lock "~> 3.10.2"

set :application, "as_site"
set :repo_url, "git@github.com:AlturaSoluciones/web_altura_soluciones.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, ->{ "/home/ruby/rubyapps/#{fetch(:application)}" }

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :deploy_via, :remote_cache
set :git_shallow_clone, 1

set :rvm_type, :system
set :rvm_ruby_version, "#{File.read('.ruby-version').strip}@#{File.read('.ruby-gemset').strip}"

set :ssh_options, {
    #verify_host_key: :secure,
    forward_agent: true
}

namespace :deploy do

  after :publishing, :restart

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :sudo, "service as_site_#{fetch(:rails_env)} stop", raise_on_non_zero_exit: false
        execute :sudo, "service as_site_#{fetch(:rails_env)} start"
      end
    end
  end

  after :publishing, :restart

end

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
