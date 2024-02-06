class BudgetTransactionsController < ApplicationController

  def show
    @budget_transaction = BudgetTransaction.find_by_id(params[:id])
    @group = Group.find_by_id(params[:group_id])
  end

  def new
    @budget_transaction = BudgetTransaction.new
  end

  def create
    @budget_transaction = current_user.budget_transactions.build(budget_transaction_params)

    if @budget_transaction.save
      group = Group.find(params[:group_id])
      GroupTransaction.create(budget_transaction: @budget_transaction, group: group)
      redirect_to @budget_transaction, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  private

  def budget_transaction_params
    params.require(:budget_transaction).permit(:name, :amount)
  end
end
