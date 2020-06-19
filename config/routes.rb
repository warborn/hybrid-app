Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  namespace :api, defaults: { format: :json } do
    devise_for :users, defaults: { format: :json },
                                  class_name: 'ApiUser',
                                  only: [],
                                  path_names: { sign_in: 'login',
                                  sign_out: 'logout' }

    devise_scope :user do
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
    end
  end
end
