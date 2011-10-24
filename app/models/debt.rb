class Debt < ActiveRecord::Base
  belongs_to :expense

  belongs_to :user
end
