class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.string :source
      t.string :value
      t.boolean :system
      t.integer :creator_id
      t.string :creator_type
      t.belongs_to :movie

      t.timestamps
    end
  end
end
