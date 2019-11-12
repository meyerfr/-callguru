Rails.application.routes.draw do
  root to: 'projects#index'
  # get 'pages/log_in_as'
  get 'pages/setting'
  get '/patients/:id', to: 'patients#show', as: 'patient'
  get 'pages/change_sign_in_as/:user_id', to: 'pages#change_sign_in_as', as: 'change_sign_in_as'
  get 'pages/blueprint'
  devise_for :users, skip: [:sessions]
  as :user do
    get 'sign_in', to: 'users/sessions#new', as: :new_user_session
    post 'sign_in', to: 'users/sessions#create', as: :user_session
    delete 'sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :users, shallow: true do
      resources :projects, shallow: true do
        resources :stages, shallow: true do
          resources :sections, shallow: true do
            resources :script
          end
        end
      end
    end
  end
end
