class CreateDesks < ActiveRecord::Migration[6.0]
  def change
    create_table :desks do |t|
      t.integer :price
      t.string :title
      t.string :location
      t.integer :seats
      t.datetime :start_date
      t.datetime :end_date
      t.references :user

      t.timestamps
    end
  end
end
