class AddDescriptionToWinery < ActiveRecord::Migration
  def self.up
    add_column :wineries, :description, :text
  end

  def self.down
    remove_column :wineries, :description
  end
end
