class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.integer :price, null: false
      t.datetime :date_start, null: false
      t.datetime :date_end, null: false

      t.belongs_to :movie

      t.timestamps
    end
  end
end
