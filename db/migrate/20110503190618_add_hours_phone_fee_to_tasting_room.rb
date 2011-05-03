class AddHoursPhoneFeeToTastingRoom < ActiveRecord::Migration
  def self.up
    add_column :tasting_rooms, :hours, :string
    add_column :tasting_rooms, :phone, :string
    add_column :tasting_rooms, :tasting_fee, :string
  end

  def self.down
    remove_column :tasting_rooms, :tasting_fee
    remove_column :tasting_rooms, :phone
    remove_column :tasting_rooms, :hours
  end
end
