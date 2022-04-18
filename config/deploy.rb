# frozen_string_literal: true

require 'mina/rails'
require 'mina/git'

set :user, 'littlebigprime'
set :application_name, 'littlebigprime'
set :deploy_to, '/var/www/littlebigprime'
set :repository, 'git@github.com:Manfred/littlebigprime.git'

set :domain, 'tuindorp-littlebigprime'
set :branch, 'main'
set :primary, true

set :forward_agent, true

set :shared_dirs, fetch(:shared_dirs, []).push(
  'log',
  'tmp'
)
task :environment do
end

task :setup do
end

namespace :env do
  task :umask do
    comment %(Setting umask to make files group writable)
    command 'umask 0002'
  end
end

namespace :db do
  task :backup do
    in_path(fetch(:current_path)) do
      timestamp = Time.zone.now.strftime('%Y%m%d%H%M')
      filename = "#{fetch(:rails_env)}-#{timestamp}.dump"
      comment %(Dump database to #{filename})
      command "pg_dump -U app -C -Fc -w -h localhost -f /var/www/tube/shared/backups/#{filename} tube_#{fetch(:rails_env)}"
    end
  end
end

namespace :tusd do
  task :restart do
    primary = fetch(:primary)
    if primary
      comment %(Restart tusd)
      command %(sudo /usr/bin/systemctl restart tusd)
    else
      comment %(You can only restart tusd on the primary app server)
    end
  end

  task :upgrade do
    primary = fetch(:primary)
    if primary
      comment %(Remove tusd binary and restart)
      command %(rm -f /var/www/tube/shared/tmp/tusd)
      command %(sudo /usr/bin/systemctl restart tusd)
    else
      comment %(You can only upgrade tusd on the primary app server)
    end
  end
end

desc 'Deploy to the server'
task :deploy do
  deploy do
    primary = fetch(:primary)
    invoke :'env:umask'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    command %(/usr/local/rbenv/shims/bundler config set --local deployment "true")
    command %(/usr/local/rbenv/shims/bundler install)
    invoke :'rails:db_migrate' if primary
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %(mkdir -p tmp/)

        comment %(Restart Ruby on Rails)
        command %(sudo /usr/bin/systemctl restart littlebigprime)

        # comment %(Restart Sidekiq)
        # command %(sudo /usr/bin/systemctl restart sidekiq)
        #
        # comment %(Clear Rails cache)
        # command %(sudo -u app /usr/local/rbenv/shims/bundle exec bin/rails runner --environment=#{fetch(:rails_env)} "Rails.cache.clear")
      end
    end
  end
end
