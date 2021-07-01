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
class ShowSerializer
  include JSONAPI::Serializer

  attributes :date_end, :date_start, :price

  attribute :movie do
    {
      id: movie.id,
      title: movie.title
    }
  end
end
