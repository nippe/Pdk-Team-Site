class Activity < ActiveRecord::Base
  belongs_to :activity_type
  has_many :rvsps
  #has_many :users, :through =>  :rvsp_users


  def attending
     rvsps.where("activity_id = ? AND rvsp_status_id = ?", self.id, 1 )
  end

  def maybe_coming
    rvsps.where("activity_id = ? AND rvsp_status_id = ?", self.id, 3 )
  end

  def not_coming
    rvsps.where("activity_id = ? AND rvsp_status_id = ?", self.id, 2 )
  end

  def no_answer
    rvsps.where("activity_id = ? AND rvsp_status_id = ?", self.id, 4 )
  end
  
end
