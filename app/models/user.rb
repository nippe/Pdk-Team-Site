class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :rvsp

  def full_name
    first_name + " " + last_name
  end
end
