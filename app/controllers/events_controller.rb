class EventsController < ApplicationController

    before_action :set_event, only: %i[show edit update destroy]

  def index
    @upcoming_events = Event.upcoming_events
    @past_events = Event.past_events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  
  def create

    @event = current_user.created_events.build(event_params)
  
    respond_to do |format|
      if @event.save
        format.html { redirect_to current_user }
      else
        format.html { render :new }
      end
    end
  end

  def rsvp
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      redirect_to root_path, notice: "You are already on the list"
    else
      @event.attendees << current_user
      redirect_to events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
