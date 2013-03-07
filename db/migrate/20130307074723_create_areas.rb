class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.text :description
      t.integer :x_max
      t.integer :y_max

      t.timestamps
    end
  end
end
