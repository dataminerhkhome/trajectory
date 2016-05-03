class CreateStrokes < ActiveRecord::Migration
  def change
    create_table :strokes do |t|
      t.float :velocity
      t.float :angle
      t.timestamps
    end
  end
end
