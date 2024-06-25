class OptionsController < ApplicationController
  def create
    @option = Option.new(option_params)
    @poll = Poll.find(params[:poll_id])
    @option.poll = @poll
    @option.save
    redirect_to event_polls_path(@poll.event)
  end

  private

  def option_params
    params.require(:option).permit(:description)
  end
end
