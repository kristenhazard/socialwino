class CreateWines < ActiveRecord::Migration
  def self.up
    create_table :wines do |t|
      t.integer :winery_id
      t.integer :region_id
      t.integer :variety_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :wines
  end
end
