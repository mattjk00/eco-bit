Rails.application.routes.draw do
  
  get 'search/index'
  
  get 'admin/index'

  get 'stockmarket/index'

  get 'signin/index'
  get 'signin/create'
  get 'signin/new'
  post 'signin/create'

  resources :companies
  
  get 'home/index'
  post 'home/search'
  get 'companies/index'
  post 'companies/new'
  get '/companies/buy/:id', to: 'companies#buy'
  root 'home#index'
end
