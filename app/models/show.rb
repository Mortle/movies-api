# frozen_string_literal: true

# == Schema Information
#
# Table name: shows
#
#  id         :bigint           not null, primary key
#  date_end   :datetime         not null
#  date_start :datetime         not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint
#
# Indexes
#
#  index_shows_on_movie_id  (movie_id)
#
class Show < ApplicationRecord
  belongs_to :movie

  # TODO: return only active shows
  scope :active, -> { where('date_start > ?', DateTime.now) }
end
