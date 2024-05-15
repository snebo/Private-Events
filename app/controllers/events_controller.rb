class EventsController < ApplicationController
  def past
    @events = Event.past_events
  end
  def future
    @events = Event.future_events
  end
  
  def index
    @events = Event.all.order(:starting)
    @past_events = Event.past_events
    @future_events = Event.future_events
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

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :starting)
  end
end
