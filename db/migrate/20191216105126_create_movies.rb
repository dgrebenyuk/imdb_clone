class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.float :average_rating, default: 0
      t.timestamps
    end
  end
end
