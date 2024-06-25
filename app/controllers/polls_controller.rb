class PollsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @polls = @event.polls
    @vote = Vote.new
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
