class WineVarietal < ActiveRecord::Base
  belongs_to :wine
  belongs_to :varietal
end
