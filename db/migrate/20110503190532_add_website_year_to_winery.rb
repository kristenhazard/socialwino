class AddWebsiteYearToWinery < ActiveRecord::Migration
  def self.up
    add_column :wineries, :website_url, :string
    add_column :wineries, :year_established, :integer
    add_column :wineries, :email_address, :string
  end

  def self.down
    remove_column :wineries, :email_address
    remove_column :wineries, :year_established
    remove_column :wineries, :website_url
  end
end
