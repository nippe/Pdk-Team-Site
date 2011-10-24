class ExpensesController < ApplicationController



  def index
    @expenses = current_user.expenses
    @debts = current_user.debts
  end

  def new
    @expense = Expense.new

    respond_to do |format|
      format.html
      format.json {render :json => @expense}
    end
  end


  def create

    user_ids =  params[:expense][:debts_user_ids].split(',') if params[:expense].has_key?(:debts_user_ids)
    params[:expense].delete(:debts_user_ids)
    params.delete(:expense_debtee)


    #@expense = Expense.new(:params[:expense])
    @expense = Expense.new(:user_id => params[:expense][:user_id], :description => params[:expense][:description])
    date_string = params[:expense]["date(1i)"] + "-" + params[:expense]["date(2i)"] + "-" + params[:expense]["date(3i)"]
    @expense.date = Time.parse(date_string) + 2.hours

    if @expense.save
      # Add the guilty parties
      logger.debug 'Expense saved, user_ids: ' + user_ids.to_s

      user_ids.each do |debtee_id|
        logger.debug 'debetee_id: ' + debtee_id.to_s
        debt = Debt.new(:expensee_user_id => params[:expense][:user_id], :user_id => debtee_id)
        debt.expense = @expense
        debt.sum = params['debpt_part_' + debtee_id.to_s]
        debt.save
      end

      redirect_to expenses_url
    else

    end




  end


end
