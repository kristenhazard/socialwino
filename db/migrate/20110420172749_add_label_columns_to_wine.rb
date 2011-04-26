class AddLabelColumnsToWine < ActiveRecord::Migration
  def self.up
    add_column :wines, :label_file_name, :string
    add_column :wines, :label_content_type, :string
    add_column :wines, :label_file_size, :integer
    add_column :wines, :label_updated_at, :datetime
  end

  def self.down
    remove_column :wines, :label_updated_at
    remove_column :wines, :label_file_size
    remove_column :wines, :label_content_type
    remove_column :wines, :label_file_name
  end
end
