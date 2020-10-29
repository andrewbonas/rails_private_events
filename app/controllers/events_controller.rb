class EventsController < ApplicationController

    before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  
  def edit

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

  def destroy

  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
