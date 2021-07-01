# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :shows, dependent: :destroy
  has_many :ratings, dependent: :destroy
end
