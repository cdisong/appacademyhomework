Rails.application.routes.draw do
  resources :comments

  resources :links do
    resources :comments, only: [:create]
  end

  resource :session

  resources :users



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
