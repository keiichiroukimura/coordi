Rails.application.routes.draw do
  root to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :clothes do
    resources :favorites, only: [:create, :destroy, :index]
    collection do
      post :confirm
    end
  end
end
