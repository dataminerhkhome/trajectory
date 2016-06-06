class ChangeStrokesFields < ActiveRecord::Migration
  def change
    remove_column :positions, :flight_time, :integer
    add_column :positions, :flight_time, :float
    
  end

end
