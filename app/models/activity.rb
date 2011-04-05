class Activity < ActiveRecord::Base
  belongs_to :activity_type
  has_many :rvsps
  #has_many :users, :through =>  :rvsp_users
end
