class PollsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @polls = @event.polls.includes(options: :votes)

    # Suppose you have a logged in user, you can fetch current_user
    # Assuming you have a method to find the current_user
    @current_user = current_user

    # Build a hash to store whether the current_user has voted for each option
    @voted_options = {}

    # Iterate through polls and options to check if current_user has voted
    @polls.each do |poll|
      poll.options.each do |option|
        @voted_options[option.id] = option.votes.exists?(event_user_id: @current_user.event_users.pluck(:id))
      end
    end
  end

  def new
    @poll = Poll.new
    @event = Event.find(params[:event_id])
  end

  def create
    @poll = Poll.new(poll_params)
    @event = Event.find(params[:event_id])
    @poll.event = @event
    @poll.save
    options = params[:poll][:options]
    options.each do |option|
      possibility = Option.new(title: option, poll: @poll)
      possibility.save
    end

    if @poll.save
      redirect_to event_polls_path(@event)
    else
      render :new
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:question)
  end
end
