class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :stroke, index: true
      t.float :distance
      t.float :height
      t.integer :flight_time
      t.float :x_speed
      t.float :y_speed
      t.timestamps
    end
  end
end
