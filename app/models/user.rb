class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
  acts_as_authentic
  acts_as_authorization_subject :association_name => :roles
  
  has_many :rvsps
  has_many :expenses
  #has_and_belongs_to_many :debts  # Am I thinking this through correct?
  has_many :debts  # Am I thinking this through correct?

  validates_uniqueness_of :login
  validates_uniqueness_of :email

  # My own spam filtering
  attr_accessor :noshow # fake attribute used for spam trapping
  validates_length_of :noshow, :in => 0..1

  def full_name
    [first_name, last_name].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

  
end
