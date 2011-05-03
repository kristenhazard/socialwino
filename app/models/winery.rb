class Winery < ActiveRecord::Base
  has_many :twitter_feeds, :dependent => :destroy
  has_many :wines
  has_many :tasting_rooms
  
  #has_many :users
  accepts_nested_attributes_for :twitter_feeds, :reject_if => lambda { |a| a[:screen_name].blank? }, :allow_destroy => true

  has_attached_file :logo, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "winery/logos/:id/:style.:extension"
                    
  has_attached_file :background,
                    :styles => { :ipad => "1024x768>",
                                 :computer => "1280x800",
                                 :tv => "1920x1080>",
                                 :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "winery/backgrounds/:id/:style.:extension"

end
