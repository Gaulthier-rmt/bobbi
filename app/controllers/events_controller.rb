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
    @categories = @event.categories
  end

  def new
    @event = Event.new
    @categories = @event.categories
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

  def recap
    @event = Event.find(params[:id])
    @theme = @event.theme
    @participants = @event.users
  end


  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :time, :theme, :photo, :address)
  end
end
