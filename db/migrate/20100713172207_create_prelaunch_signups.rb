class CreatePrelaunchSignups < ActiveRecord::Migration
  def self.up
    create_table :prelaunch_signups do |t|
      t.string :email
      t.boolean :winery

      t.timestamps
    end
  end

  def self.down
    drop_table :prelaunch_signups
  end
end
