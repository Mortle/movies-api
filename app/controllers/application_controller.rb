# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  devise_token_auth_group :member, contains: %i[moviegoer cinema_owner]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
    current_member
  end

  private

    def user_not_authorized
      render json: {
        errors: {
          full_messages: ['You are not authorized to perform this action.']
        }
      }, status: :unauthorized
    end
end
