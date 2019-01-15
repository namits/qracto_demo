Rails.application.routes.draw do
  root 'home#index'
  get '/data-discovery', to: 'home#data_discovery'
end
