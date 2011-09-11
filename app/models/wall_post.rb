class WallPost < ActiveRecord::Base
   validates_presence_of :body
   belongs_to :user



  def display_date
    if self.created_at.today?
      "Idag"
    elsif self.created_at.day == Time.now.tomorrow.day
      "I morgon"
    else
      self.created_at.strftime("%Y-%m-%d")
    end

  end

end
