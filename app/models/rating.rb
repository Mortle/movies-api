# frozen_string_literal: true

# == Schema Information
#
# Table name: ratings
#
#  id           :bigint           not null, primary key
#  creator_type :string
#  source       :string
#  system       :boolean
#  value        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  creator_id   :integer
#  movie_id     :bigint
#
# Indexes
#
#  index_ratings_on_movie_id  (movie_id)
#
class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :creator, polymorphic: true, optional: true

  scope :system, -> { where(system: true) }
  scope :omdb, -> { where(system: false) }
end
