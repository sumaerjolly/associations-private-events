# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :require_user, except: [:index]

  def new
    @users = User.all
    @users = current_user.except_current_user(@users).pluck(:name)
    @event = Event.new
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def index
    @events = Event.all
  end

  def create
    @users = User.all
    @users = current_user.except_current_user(@users).pluck(:name)
    @event = current_user.events.build(event_params)
    if @event.save
      create_attendees
      flash[:success] = 'Event was created'
      redirect_to events_path

    else
      flash[:danger] = 'There was an error in trying to create that event'
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end

  def create_attendees
    params[:event][:attendees].each do |name|
      @user << @event if (@user = User.find_by(name: name).attended_events)
    end
  end
end
