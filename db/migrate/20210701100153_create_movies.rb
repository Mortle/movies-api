class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      # OMDb fields
      t.string :title, null: false
      t.integer :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.text :writer
      t.text :actors
      t.text :plot
      t.string :language
      t.string :country
      t.string :poster
      t.integer :metascore
      t.integer :imdb_rating
      t.string :imdb_votes
      t.string :imdb_id
      t.string :dvd
      t.string :production

      t.timestamps
    end
  end
end
