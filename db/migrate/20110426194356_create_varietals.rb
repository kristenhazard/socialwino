class CreateVarietals < ActiveRecord::Migration
  def self.up
    create_table :varietals do |t|
      t.string :name
      t.string :grape

      t.timestamps
    end
  end

  def self.down
    drop_table :varietals
  end
end
