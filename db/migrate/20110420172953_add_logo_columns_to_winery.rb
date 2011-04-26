class AddLogoColumnsToWinery < ActiveRecord::Migration
  def self.up
    add_column :wineries, :logo_file_name, :string
    add_column :wineries, :logo_content_type, :string
    add_column :wineries, :logo_file_size, :integer
    add_column :wineries, :logo_updated_at, :datetime
  end

  def self.down
    remove_column :wineries, :logo_updated_at
    remove_column :wineries, :logo_file_size
    remove_column :wineries, :logo_content_type
    remove_column :wineries, :logo_file_name
  end
end
