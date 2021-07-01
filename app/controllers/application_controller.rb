# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  devise_token_auth_group :member, contains: %i[moviegoer cinema_owner]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def pundit_user
    current_member
  end

  private

    def formatted_errors(message = 'error', errors = {})
      {}.tap do |h|
        h[:message] = message
        h[:errors] = errors if errors.present?
      end
    end

    def formatted_message(message)
      {}.tap do |h|
        h[:message] = message
      end
    end

    def record_not_found
      render json: formatted_errors('Record not found.'),
             status: :not_found
    end

    def user_not_authorized
      render json: formatted_errors('You are not authorized to perform this action.'),
             status: :unauthorized
    end
end
