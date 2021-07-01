# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  actors      :text
#  country     :string
#  director    :string
#  dvd         :string
#  genre       :string
#  imdb_rating :integer
#  imdb_votes  :string
#  language    :string
#  metascore   :integer
#  plot        :text
#  poster      :string
#  production  :string
#  rated       :string
#  released    :string
#  runtime     :string
#  title       :string           not null
#  writer      :text
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  imdb_id     :string
#
class Movie < ApplicationRecord
  has_many :shows, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def average_system_rating
    return 0 if ratings.system.empty?

    ratings.system.sum { |rating| rating.value.to_i } / ratings.system.size
  end
end
