class Activity < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  #require "mathn"
  
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

  def all_invitations
    rvsps.where("activity_id = ?", self.id)
  end

  #TODO: Add calculation for duration
  def duration
    1
  end

  # for event_calendar (TODO: should there be a separate name)
  
  def name
    if title.nil?
      activity_type.name
    else
      title
    end
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
      self.start_at.strftime("%Y-%m-%d")
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
      "har inte svarat"
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
