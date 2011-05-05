class Varietal < ActiveRecord::Base
  has_many :wine_varietals
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
end
