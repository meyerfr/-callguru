Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :users
  end
  resources :projects do
    resources :stages do
      resources :sections do
        resources :script
      end
    end
  end
end
