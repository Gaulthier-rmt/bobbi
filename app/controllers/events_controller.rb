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
    user = current_user
    @category = user.event_categories.where(event_id: @event.id).first.category
  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      @event.users << current_user
      all_categories = params[:event][:category_ids].reject(&:empty?).map(&:to_i)
      categories = Category.where(id: all_categories)
      categories.each do |category|
        EventCategory.create(event: @event, category: category)
      end
      EventCategory.create(event: @event, category: Category.find_by(name: "Admin"), user: current_user)
      redirect_to event_path(@event)
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

    ####

  def recap
    @event = Event.find(params[:id])
    @theme = @event.theme
    @participants = @event.users
  end


  def share
    @event = Event.find(params[:id])
    @event_user = EventUser.create(user: current_user, event: @event, coming: true)
    @url = "http://localhost:3000/events/#{params[:id]}" # NOM DE DOMAINE A CHANGER
  end

  private

  def set_categories
    @categories = Category.all
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :time, :theme, :photo)
  end
end
