class EventsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  
  def new
    @event = Event.new 
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def index
    @events = Event.all
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event was created"
      redirect_to @event

    else
      flash[:danger] = "There was an error in trying to create that event"
      render 'new'
    end
  end

  private
  def event_params
    params.require(:event).permit(:description)
  end
end
