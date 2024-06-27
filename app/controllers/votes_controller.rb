class VotesController < ApplicationController
  def create
    @vote = Vote.new
    event_user = EventUser.find_by(event_id: params[:event_id], user_id: current_user.id)
    @event = Event.find(params[:event_id])
    # @event.event_users.map(&:user).include?(current_user)
    @vote.event_user = event_user
    option = Option.find(params[:option_id])
    @vote.option = option
    voted = Vote.find_by(event_user: event_user, option: option)

    if voted
      Vote.find_by(event_user: event_user, option: option).destroy
      if params[:origin] == "index"
        redirect_to event_path(params[:event_id], anchor: "poll-anchor")
      else
        redirect_to event_polls_path(params[:event_id])
      end
      # flash[:notice] = "Vote pris en compte"
      return
    end

    @vote.save
    if params[:origin] == "index"
      redirect_to event_path(params[:event_id], anchor: "poll-anchor")
    else
      redirect_to event_polls_path(params[:event_id])
    end
    # flash[:notice] = "Vote pris en compte"

  end

  private

  def vote_params
    params.require(:vote).permit(:option_id)
  end
end
