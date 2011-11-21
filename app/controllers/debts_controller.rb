class DebtsController < ApplicationController
  respond_to :json
  respond_to :html, :only => :mine



  def mine
    @debts = Debt.find_all_by_user_id_and_payment_approved(current_user.id, false)
    respond_with(@debts)
  end


  def paid
    logger.debug('Param: #{params[:debt_id]}')
  	debt = Debt.find_by_id(params[:debt_id])

    logger.debug(debt)

  	debt.paid = true if debt.user == current_user

  	#debt.payment_approved = true if debt.expense.user == current_user

  	if debt.save() 
  		respond_with(debt)
  	end

  end

  def approve_payment
    logger.debug(' - > Entering approve_payment controller action')

    debt = Debt.find(params[:debt_id])

    if debt.expense.user == current_user
      debt.payment_approved = true
      if debt.save
        debt.expense.paid! if debt.expense.all_debts_approved?
        respond_with(debt)
      end
    else
      #TODO: Rails exception
    end


  end


end
