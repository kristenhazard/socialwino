class Wine < ActiveRecord::Base
  belongs_to :winery
  belongs_to :variety
  belongs_to :region
  
  has_attached_file :label, 
                    :styles => { :tweet => "300x300>", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "wine/labels/:id/:style.:extension"
  
end
