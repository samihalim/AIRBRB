class AddCoordinatesToDesks < ActiveRecord::Migration[6.0]
  def change
    add_column :desks, :latitude, :float
    add_column :desks, :longitude, :float
  end
end
