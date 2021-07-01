# frozen_string_literal: true

class Show < ApplicationRecord
  belongs_to :movie

  # TODO: return only active shows
  scope :active, -> { where('date_start > ?', DateTime.now) }
end
