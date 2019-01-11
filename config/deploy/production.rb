set :branch, "master"
set :rails_env, "production"

role :app, 'root@159.89.155.36'
role :web, 'root@159.89.155.36'
role :db, 'root@159.89.155.36', :primary => true

# set :branch, "master"
# server "159.89.155.36", user: "root", roles: %w{app db web}
