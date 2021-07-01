# frozen_string_literal: true

class ShowPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user.present? && user.cinema_owner?
  end

  def show?
    user.present?
  end

  def update?
    user.present? && user.cinema_owner?
  end

  def destroy?
    user.present? && user.cinema_owner?
  end
end
