class InvitationsController < ApplicationController
  def create
    @event = Event.find(params[:id])
    @user = current_user
    @event.attendees << @user
    redirect_to root_path
  end
end
