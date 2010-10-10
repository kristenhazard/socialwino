class CreateWineries < ActiveRecord::Migration
  def self.up
    create_table :wineries do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :wineries
  end
end
