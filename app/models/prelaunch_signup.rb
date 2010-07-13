class PrelaunchSignup < ActiveRecord::Base
  validates_presence_of :email, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :email, :on => :create, :message => "must be unique"
end
