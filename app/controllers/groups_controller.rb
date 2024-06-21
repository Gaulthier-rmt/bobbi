class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @group = Group.first

    if params[:group_id].present?
      @group = Group.find(params[:group_id])
    end

    respond_to do |format|
      format.html
      format.text { render partial: "groups/group", locals: { group: @group }, formats: [:html] }
    end
  end

  def show
    @group = Group.find(params[:id])
    @events = @group.events
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end
