Rails.application.routes.draw do
  
  get 'admin/index'

  get 'stockmarket/index'

  get 'signin/index'
  get 'signin/create'
  get 'signin/new'
  post 'signin/create'

  resources :companies
  
  get 'home/index'
  get 'companies/index'
  post 'companies/new'
  root 'home#index'
end
