# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :all_users, only: %i[new create]

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
      create_attendees if params[:event][:attendees]
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
    params[:event][:attendees].each do |username|
      @user << @event if (@user = User.find_by(username: username).attended_events)
    end
  end

  def all_users
    @users = User.all
    @users = current_user.except_current_user(@users).pluck(:username)
  end
end
