class GroupsController < ApplicationController
  def index
    @groups = Group.joins(:group_users).where(group_users: { user_id: current_user.id }).distinct
    @random_photo = {}

    @groups.each do |group|
      @random_photo[group.id] = {}
      if group.photos.any?
        @random_photo[group.id] = group.photos.sample
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
      added_groups = params[:group][:group_user_ids].reject(&:empty?).map(&:to_i)
      GroupUser.create(group: @group, user: current_user)
      added_groups.each do |group_id|
        group = Group.find(group_id)
        group.users.each do |user|
          GroupUser.create(group: @group, user: user)
        end
      end
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
