class Activity < ActiveRecord::Base
  belongs_to :activity_type
  has_many :rvsps
  #has_many :users, :through =>  :rvsp_users

  has_event_calendar

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

  #TODO: Add calculation for duration
  def duration
    1
  end

  # for event_calendar (TODO: should there be a separate name)
  def name
    activity_type.name
  end

  def is_user_attending?(user)
    self.rvsps.find_by_user_id(user.id).rvsp_status_id == 1
  end

  def is_user_maybe_attending?(user)
    self.rvsps.find_by_user_id(user.id).rvsp_status_id == 3
  end

  def is_user_not_attending?(user)
    self.rvsps.find_by_user_id(user.id).rvsp_status_id == 2
  end


end
