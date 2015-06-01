Rails.application.routes.draw do

  root 'requests#index'
  # root 'offers#index'
  # get 'requests/index'

  resources :offers
  resources :requests

end
