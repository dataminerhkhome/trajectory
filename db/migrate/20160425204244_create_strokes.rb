class CreateStrokes < ActiveRecord::Migration
  def change
    create_table :strokes do |t|
      t.integer :velocity
      t.integer :angle
      t.timestamps
    end
  end
end
