class EventCategoriesController < ApplicationController
  def create
    user = current_user
    event = Event.find(params[:event_id])
    category = Category.find(params[:category_id])
    event_category = EventCategory.new(user: user, event: event, category: category)
    event_category.save
    redirect_to event_path(event)
  end

  private

  def event_category_params
    params.require(:event_category).permit(:event_id, :category_id, :user_id, :event_categrory)
  end
end
