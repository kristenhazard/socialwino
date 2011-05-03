class Wine < ActiveRecord::Base
  belongs_to :winery
  has_many :wine_varietals
  accepts_nested_attributes_for :wine_varietals, :reject_if => lambda { |a| a[:percentage].blank? }, :allow_destroy => true
  
  has_attached_file :label, 
                    :styles => { :tweet => "300x300>", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "wine/labels/:id/:style.:extension"
  
end
