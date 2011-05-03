class AddAppelationAndNotesToWine < ActiveRecord::Migration
  def self.up
    add_column :wines, :appelation, :string
    add_column :wines, :notes, :text
    add_column :wines, :summary_notes, :string
  end

  def self.down
    remove_column :wines, :summary_notes
    remove_column :wines, :notes
    remove_column :wines, :appelation
  end
end
