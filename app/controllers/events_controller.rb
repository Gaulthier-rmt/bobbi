class EventsController < ApplicationController

  before_action :authenticate_user!

  def index
    @events = Event.joins(:event_users).where(event_users: { user_id: current_user.id }).distinct
    # @events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
    @photos = @event.photos
    @recipes = @event.recipes
    @ingredients = @event.ingredients
    @polls = @event.polls
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to evenement_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to evenement_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to evenenements_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :time, :location, :theme)
  end
end
