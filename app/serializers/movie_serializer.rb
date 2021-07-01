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
class MovieSerializer
  include JSONAPI::Serializer

  attributes :imdb_id, :title, :year, :rated, :released, :runtime, :genre,
             :director, :writer, :actors, :plot, :language, :country,
             :poster, :metascore, :imdb_rating, :imdb_votes, :dvd,
             :production

  attribute :ratings do |movie|
    RatingSerializer.new(movie.ratings.not_system).serializable_hash.to_json
  end

  attribute :system_rating do
    {
      source: 'System rating',
      value: movie.average_system_rating
    }
  end
end
