class GroupsController < ApplicationController
  def index
    @groups = Group.where(author_id: current_user.id)
  end

  def show
    @group = Group.includes(group_transactions: :budget_transaction).find_by_id(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'Category created Successfully'
      redirect_to groups_path
    else
      flash[:error] = @group.errors.full_messages.to_sentence
      redirect_to new_group_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :icon).merge(author: current_user)
  end
end
