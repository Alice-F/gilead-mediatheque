Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do #as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: :edit_user_registration
    put 'users', to: 'devise/registrations#update', as: :user_registration
  end

  root to: 'pages#home'

  # -------- ADMIN ROUTES ---------
  authenticate :user, ->(user) { user.admin } do
    namespace :admin do
      resources :users, only: %i[index create]
    end
  end
end
