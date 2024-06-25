class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @random_photos = {}

    @groups.each do |group|
      photos = group.photos
      if photos.any?
        @random_photos[group.id] = photos.sample
      else
        @random_photos[group.id] = Photo.first
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
