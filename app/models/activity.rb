class Activity < ActiveRecord::Base
  has_one :activity_type
  has_many :rvsp
  #has_many :users, :through =>  :rvsp_users
end
