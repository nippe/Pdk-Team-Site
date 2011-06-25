class Rvsp < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  has_one :rvsp_status



end
