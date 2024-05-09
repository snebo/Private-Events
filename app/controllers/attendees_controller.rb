class AttendeesController < ApplicationController
  def create
    @event = Event.find(params[:id]) # get current event
    @attendee = @event.attendees.build(attend_params)
    if @attendee.save
      flash[:success] = "#{current_user.username.capitalize} is now attending"
    else
      flash[:error] = "Failed to register for event"
    end
    redirect_to @event # take me back to event after registering
  end
  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy
    flash[:success] = "No longer following this event"
    redirect_to @event
  end

  private

  def attend_params
    params.require(:attendees).permit(:user_id, :event_id)
  end
end
