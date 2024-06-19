class EventsController < ApplicationController

  before_action :authenticate_user!

  def index
    @event_user = EventUser.where(user_id: current_user.id)
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @photos = @event.photos
    @recipes = @event.recipes
    @ingredients = @event.ingredients
    @polls = @event.polls
    @categories = @event.categories
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path(@event)
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to events_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to evenenements_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :time, :theme, :photo, category_ids: [])
  end
end
