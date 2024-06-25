class SongsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @songs = @event.songs
  end

  def create
    @event = Event.find(params[:event_id])
    @song = Song.new(song_params)
    @song.event = @event
    if @song.save
      redirect_to event_songs_path(@event)
    else
      render 'events/show'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to event_songs_path(@song.event)
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end
end
