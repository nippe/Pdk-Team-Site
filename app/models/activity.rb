class Activity < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  belongs_to :activity_type
  has_many :rvsps
  
  has_event_calendar


  def attending
    #rvsps.where(activity_id: id, rvsp_status_id: 1)
    rvsps.where("activity_id = ? AND rvsp_status_id = ?", self.id, 1 )
  end

  def maybe_coming
    #rvsps.where(activity_id: id, rvsp_status_id: 3)
    rvsps.where("activity_id = ? AND rvsp_status_id = ?", self.id, 3 )
  end

  def not_coming
    #rvsps.where(activity_id: id, rvsp_status_id: 2)
    rvsps.where("activity_id = ? AND rvsp_status_id = ?", self.id, 2 )
  end

  def no_answer
    #rvsps.where(activity_id: id, rvsp_status_id: 4)
    rvsps.where("activity_id = ? AND rvsp_status_id = ?", self.id, 4 )
  end

  def all_invitations
    #rvsps.where(activity_id: id)
    rvsps.where("activity_id = ?", self.id)
  end

  def duration
   ((end_at - start_at) / 3600).round(1)
  end

  
  def name
    title || activity_type.name
  end


  def is_user_attending?(user)
    self.rvsps.find_by_user_id(user.id).rvsp_status_id == 1 if is_user_invited?(user)
  end

  def is_user_maybe_attending?(user)
    self.rvsps.find_by_user_id(user.id).rvsp_status_id == 3 if is_user_invited?(user)
  end

  def is_user_not_attending?(user)
    self.rvsps.find_by_user_id(user.id).rvsp_status_id == 2 if is_user_invited?(user)
  end


  def display_date
    if self.start_at.today?
      "Idag"
    elsif self.start_at.day == Time.now.tomorrow.day
      "I morgon"
    else
      self.start_at.to_s(:pdk_short_date)
    end
  end


  def user_status(user)
    if is_user_attending?(user)
      "Kommer"
    elsif is_user_maybe_attending?(user)
      "Kanske kommer"
    elsif is_user_not_attending?(user)
      "Kommer inte"
    else
      "Inte svarat"
    end
  end


  def is_user_invited?(user)
    self.rvsps.find_by_user_id(user.id)
  end


  def add_rvsps(invited_user_ids)
    invited_user_ids.each do |user_id|
      rvsp = self.rvsps.new()
      rvsp.user_id = user_id
      rvsp.rvsp_status_id = 4 #TODO: Maybe use enum instead - find out how in Ruby
      rvsp.save()
    end
  end

end
