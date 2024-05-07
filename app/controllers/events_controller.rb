class EventsController < ApplicationController

  def index
    @events = Event.all
  end
  def new
    # @user = User.find(current_user.id)
    @event = current_user.events.build
  end
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to user_posts_path, notice: "Created event!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :starting)
  end
end
