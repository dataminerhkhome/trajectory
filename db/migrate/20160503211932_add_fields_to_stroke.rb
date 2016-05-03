class AddFieldsToStroke < ActiveRecord::Migration
  def change
    add_column :strokes, :height, :float
    add_column :strokes, :rise_time, :float
    
  end
end
