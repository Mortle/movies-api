# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for 'Users::Moviegoers', at: 'moviegoers_auth'
      mount_devise_token_auth_for 'Users::CinemaOwner', at: 'cinema_owner_auth'

      resources :movies, only: :show
    end
  end
end
