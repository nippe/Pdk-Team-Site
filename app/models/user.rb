class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_authorization_subject :association_name => :roles
  
  has_many :rvsps

  validates_uniqueness_of :login
  validates_uniqueness_of :email

  # My own spam filtering
  attr_accessor :noshow # fake attribute used for spam trapping
  validates_length_of :noshow, :in => 0..1

  def full_name
    first_name + " " + last_name
  end
end
