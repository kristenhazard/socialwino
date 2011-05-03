class AddFacebookUrlToWinery < ActiveRecord::Migration
  def self.up
    add_column :wineries, :facebook_url, :string
  end

  def self.down
    remove_column :wineries, :facebook_url
  end
end
