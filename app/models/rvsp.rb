class Rvsp < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  belongs_to :rvsp_status



end
