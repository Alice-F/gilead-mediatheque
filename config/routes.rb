Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do #as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: :edit_user_registration
    patch 'users', to: 'devise/registrations#update', as: :user_registration
  end

  root to: 'pages#home'

  # -------- ADMIN ROUTES ---------
  authenticate :user, ->(user) { user.admin } do
    namespace :admin do
      resources :users, only: %i[index create]
      resources :documents, only: %i[show new create edit update] do
        patch :validate
      end
    end
  end
end
