# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :moviegoers, class_name: 'Users::Moviegoer'
  devise_for :cinema_owners, class_name: 'Users::CinemaOwner'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for 'Users::Moviegoer', at: 'moviegoers_auth'
      mount_devise_token_auth_for 'Users::CinemaOwner', at: 'cinema_owner_auth'

      resources :movies, only: :show do
        resources :shows
        resources :ratings
      end
    end
  end
end
