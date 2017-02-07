Rails.application.routes.draw do

  namespace :api, defaults: {format: :json } do
    scope module: :v1 do
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]
    end
  end
  
end
