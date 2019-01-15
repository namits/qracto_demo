Rails.application.routes.draw do
  root 'home#index'
  get 'home/index', to: 'home#index'
  get 'home/data-discovery', to: 'home#data_discovery'
end
