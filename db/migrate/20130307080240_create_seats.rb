class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.references :area
      t.references :type
      t.references :state
      t.string :name
      t.integer :position
      t.integer :x_position
      t.integer :y_position
      t.integer :customer_id

      t.timestamps
    end
    add_index :seats, :area_id
    add_index :seats, :type_id
    add_index :seats, :state_id
  end
end
