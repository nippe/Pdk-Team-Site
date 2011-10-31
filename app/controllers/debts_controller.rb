class DebtsController < ApplicationController
  respond_to :json
  respond_to :html, :only => :mine



  def mine
    @debts = Debt.find_all_by_user_id(current_user.id)
    respond_with(@debts)
  end


  def paid
  	debt = Debt.find_by_id(params[:debt_id])

  	debt.paid = true if debt.user == current_user

  	debt.payment_approved = true if debt.expense.user == current_user

  	if debt.save() 
  		respond_with(debt)
  	end

  end


end
