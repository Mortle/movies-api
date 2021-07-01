# frozen_string_literal: true

class RatingPolicy < ApplicationPolicy
  def index?
    user.present? && user.cinema_owner?
  end

  def create?
    user.present?
  end

  def show?
    user.present? && user.ratings.include?(record)
  end

  def update?
    user.present? && user.ratings.include?(record)
  end

  def destroy?
    user.present? && user.ratings.include?(record)
  end
end
