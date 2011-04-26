class AddYearToWine < ActiveRecord::Migration
  def self.up
    add_column :wines, :year, :integer
  end

  def self.down
    remove_column :wines, :year
  end
end
