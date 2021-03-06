Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/setting'
  # get '/patients/:id', to: 'patients#show', as: 'patient'
  get 'pages/change_sign_in_as/:user_id', to: 'pages#change_sign_in_as', as: 'change_sign_in_as'
  get 'pages/blueprint/:project_id/:call_id', to: 'pages#blueprint', as: 'blueprint'
  devise_for :users, skip: [:sessions]
  as :user do
    get 'sign_in', to: 'users/sessions#new', as: :new_user_session
    post 'sign_in', to: 'users/sessions#create', as: :user_session
    delete 'sign_out/:user_id', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :users, shallow: true do
      resources :teams, shallow: true do
        resources :calls
      end
      resources :projects, shallow: true do
        resources :stages, shallow: true do
          resources :sections, except: :show, shallow: true do
            resources :script
          end
        end
      end
    end
  end
  get 'sections/:id/calls/:call_id', to: 'sections#show', as: 'section_show'
end
