class AddBackgroundColumnsToWinery < ActiveRecord::Migration
  def self.up
    add_column :wineries, :background_file_name, :string
    add_column :wineries, :background_content_type, :string
    add_column :wineries, :background_file_size, :integer
    add_column :wineries, :background_updated_at, :datetime
  end

  def self.down
    remove_column :wineries, :background_updated_at
    remove_column :wineries, :background_file_size
    remove_column :wineries, :background_content_type
    remove_column :wineries, :background_file_name
  end
end
