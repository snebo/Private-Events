class AttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id]) # get current event
    @attendee = @event.attendees.build(user_id: params[:user_id], event_id: params[:event_id])
    if @attendee.save
      flash[:success] = "#{current_user.username.capitalize} is now attending"
    else
      flash[:error] = "Failed to register for event"
    end
    redirect_to @event # take me back to event after registering
  end

  def destroy
    @attendee = Attendee.find_by_user_id(current_user.id)
    @attendee.destroy
    flash[:success] = "No longer following this event"
    redirect_to @event
  end

  # private

  # def attend_params
  #   params.require(:attendees).permit(:user_id, :event_id)
  # end
end
