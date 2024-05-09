Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :users

  resources :contributions do
    collection do
      patch :approve_all
    end
    member do
      patch :approve
    end
  end
end
