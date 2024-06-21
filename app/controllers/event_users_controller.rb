class EventUsersController < ApplicationController
  before_action :set_event_user, only: [:refuse_participation]

  def refuse_participation
    if @event_user.coming
      @event_user.update(coming: false)
    else
      @event_user.update(coming: true)
    end
    flash[:notice] = "Your participation status has been updated"
    redirect_to event_path(@event_user.event)
  end

  private

  def set_event_user
    @event_user = EventUser.find(params[:id])
  end
end
