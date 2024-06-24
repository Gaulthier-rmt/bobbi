class PhotosController < ApplicationController
  def index
    @event = Event.find(params[:id])
    @photos = @event.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.event = Event.find(params[:event_id])
    if @photo.save
      redirect_to event_path(@photo.event)
    else
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to event_path(@photo.event)
  end
end
