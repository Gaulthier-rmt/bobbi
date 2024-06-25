class VotesController < ApplicationController
  def create
    @vote = Vote.new
    event_user = EventUser.find_by(event_id: params[:event_id], user_id: current_user.id)
    @vote.event_user = event_user
    @vote.option = Option.find(params[:option_id])
    @vote.save
    redirect_to event_polls_path(params[:event_id])
  end

  private

  def vote_params
    params.require(:vote).permit(:option_id)
  end
end
