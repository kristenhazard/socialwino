class CreateTastingRooms < ActiveRecord::Migration
  def self.up
    create_table :tasting_rooms do |t|
      t.integer :winery_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end

  def self.down
    drop_table :tasting_rooms
  end
end
