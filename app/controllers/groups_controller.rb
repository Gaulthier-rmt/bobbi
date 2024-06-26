class GroupsController < ApplicationController
  def index
    @groups = Group.joins(:group_users).where(group_users: { user_id: current_user.id }).distinct
    @random_photos = {}

    @groups.each do |group|
      @random_photos[group.id] = {}
      if group.photos.any?
        @random_photos[group.id] = group.photos.sample
      end
    end

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
    @random_photo = @group.photos.sample
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
