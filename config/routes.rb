Rails.application.routes.draw do

    root 'events#index'

    devise_for :users
    resources :events
    resources :users
    resources :charges, only: [:new, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
