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
class RatingSerializer
  include JSONAPI::Serializer

  attributes :value, :source

  attribute :creator do |rating|
    {
      creator_type: rating&.creator&.type,
      creator_id: rating&.creator&.id
    }
  end
end
