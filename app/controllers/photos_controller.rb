class PhotosController < ApplicationController
  def index
    @event = Event.find(params[:id])
    @photos = @event.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    photo = Photo.new
    photo.event = Event.find(params[:id])
    photo.user = current_user
    photo.photo.attach(params[:image])
    intersect_groups = photo.event.groups & current_user.groups
    if intersect_groups.any?
      photo.group = intersect_groups.first
    end
    if photo.save
      redirect_to event_path(photo.event)
    else
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to event_path(@photo.event)
  end

  # private

  # def photo_params
  #   params.require(:photo).permit(:photo)
  # end

end
