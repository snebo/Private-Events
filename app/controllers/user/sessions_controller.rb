# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  def show
    @user = User.find(current_user.id)
    @user_posts = @user.events
    @reg_events = Attendee.where(user_id: current_user.id) #reutrns list of registerd events
    # sort thenm
    @past_events = []
    @upcoming_events=[]
    @reg_events.each do |evnt|
      t_evnt = Event.find(evnt.event_id)
      if t_evnt.starting >= Date.today
        @upcoming_events << t_evnt.title
      else
        @past_events << t_evnt.title
      end
    end
  end
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
