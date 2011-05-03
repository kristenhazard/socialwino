class CreateWineVarietals < ActiveRecord::Migration
  def self.up
    create_table :wine_varietals do |t|
      t.integer :wine_id
      t.integer :varietal_id
      t.integer :percentage

      t.timestamps
    end
  end

  def self.down
    drop_table :wine_varietals
  end
end
