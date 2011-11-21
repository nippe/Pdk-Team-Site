class Expense < ActiveRecord::Base
  belongs_to :user
  has_many :debts

  #validates_presence_of :description

  def all_debts_approved?
    self.debts.each do |debt|
      false if debt.payment_approved == false
    end
    true
  end

  def paid!
    self.paid_in_full=true
    self.save
  end
end
