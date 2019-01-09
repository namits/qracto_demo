
before_fork do |server, worker|
  # Disconnect since the database connection will not carry over
  if defined? ActiveRecord::Base
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "/home/qracto/production/current/tmp/pids/unicorn.pid.oldbin"

  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
  # if defined?(Resque)
  #   Resque.redis.quit
  #   Rails.logger.info('Disconnected from Redis')
  # end
end

after_fork do |server, worker|
  # Start up the database connection again in the worker
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end

  # if defined?(Resque)
  #   Resque.redis = ENV['REDIS_URI']
  #   Rails.logger.info('Connected to Redis')
  # end
end



root = "/home/qracto/production/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

# listen 80
listen "/tmp/unicorn.qracto.sock"
preload_app true
worker_processes 5
timeout 500

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end

