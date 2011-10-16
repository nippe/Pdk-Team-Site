require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end


  test "expense has a debts method" do
    expense = Expense.new(:description => 'Test expense', :date => Time.now + 2.hours)
    assert expense.respond_to?(debts)
  end
end
