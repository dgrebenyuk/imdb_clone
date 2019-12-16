class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :value, null: false
      t.belongs_to :user
      t.belongs_to :movie
      t.timestamps
    end
  end
end
