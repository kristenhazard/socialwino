class Winery < ActiveRecord::Base
  has_many :twitter_feeds, :dependent => :destroy
  accepts_nested_attributes_for :twitter_feeds, :reject_if => lambda { |a| a[:screen_name].blank? }, :allow_destroy => true
end
