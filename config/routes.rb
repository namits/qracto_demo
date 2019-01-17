Rails.application.routes.draw do
  resources :project_details
  resources :visitors
  root 'home#index'
  get '/data-discovery', to: 'home#data_discovery'
  get '/discuss-your-project', to: 'home#discuss_your_project'
end
