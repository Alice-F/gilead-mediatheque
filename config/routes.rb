Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do #as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: :edit_user_registration
    patch 'users', to: 'devise/registrations#update', as: :user_registration
  end

  root to: 'pages#home'

  resources :documents, only: %i[index show]

  # resources :folders, only: %i[index show]

  # -------- ADMIN ROUTES ---------
  authenticate :user, ->(user) { user.admin } do
    namespace :admin do
      resources :users, only: %i[index create]
      resources :documents, only: %i[new create edit update] do
        patch :validate
      end
      resources :folders, only: %i[new create]
    end
  end
end
