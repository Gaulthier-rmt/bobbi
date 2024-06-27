class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_user_events = Event.joins(:event_users).where(event_users: { user_id: current_user.id }).distinct

    @events_past = @all_user_events.where('date < ?', Time.now)
    @events_future = @all_user_events.where('date >= ?', Time.now)
  end

  def show
    @event_categories = EventCategory.where(event_id: params[:id])
    @categories = Category.joins(:event_categories).where(event_categories: { event_id: params[:id], user_id: nil })
    @current_user_category = @event_categories.where(user_id: current_user.id).last
    if @current_user_category.nil?
      @current_user_category = EventCategory.create(event_id: params[:id], user_id: current_user.id, category_id: Category.find_by(name: "Participant").id)
    end
    @event = Event.find(params[:id])
    @photos = @event.photos
    @ingredients = @event.ingredients
    @polls = @event.polls
    if EventUser.where(user: current_user, event: @event).first.nil?
      @event_user = EventUser.create(user: current_user, event: @event, coming: true)
    else
      @event_user = EventUser.where(user: current_user, event: @event).first
    end

    @polls = @event.polls.includes(options: :votes)

    @current_user = current_user

    # Build a hash to store whether the current_user has voted for each option
    @voted_options = {}

    @polls.each do |poll|
      poll.options.each do |option|
        @voted_options[option.id] = option.votes.exists?(event_user_id: @current_user.event_users.pluck(:id))
      end
    end

    user = current_user
    unless user.event_categories.where(event_id: @event.id).first == nil
      @category = user.event_categories.where(event_id: @event.id).first.category
    end
    @poll = Poll.first
  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      group_ids = params[:event][:group_ids].reject(&:empty?).map(&:to_i)
      groups = Group.where(id: group_ids)
      groups.each do |group|
        EventGroup.create(event: @event, group: group)
        group.users.each do |user|
          EventUser.create(user: user, event: @event, coming: true)
        end
      end
      # @event.users << current_user
      all_categories = params[:event][:category_ids].reject(&:empty?).map(&:to_i)
      categories = Category.where(id: all_categories)
      categories.each do |category|
        EventCategory.create(event: @event, category: category)
      end
      EventCategory.create(event: @event, category: Category.find_by(name: "Admin"), user: current_user)
      redirect_to share_event_path(@event)
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
    @markers = { lat: @event.latitude, lng: @event.longitude }
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
    params.require(:event).permit(:name, :description, :date, :time, :theme, :photo, :address, :latitude, :longitude, :category_ids => [], :group_ids => [])
  end
end
