class ExpensesController < ApplicationController

  autocomplete :users, :full_name, :full => true


  def index
    @expenses = Expense.find_all_by_user_id(current_user.id)
  end

  def new
    @expense = Expense.new

    respond_to do |format|
      format.html
      format.json {render :json => @expense}
    end
  end


  def create
    @expense = Expense.new(:params[:expense])


  end


end
