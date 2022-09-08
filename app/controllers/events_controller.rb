class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit]
  before_action :move_to_top, 
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :content).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
