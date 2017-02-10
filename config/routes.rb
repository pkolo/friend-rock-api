Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: {format: :json } do
    scope module: :v1 do
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]
      resources :bands, only: [:show, :create, :update, :destroy] do
        post '/send_friend_request', to: 'relationships#send_friend_request'
        post '/accept_friend_request', to: 'relationships#accept_friend_request'
        post '/deny_friend_request', to: 'relationships#deny_friend_request'
      end
    end
  end

end
