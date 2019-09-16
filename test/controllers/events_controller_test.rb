# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: 'jolly')
    @event = Event.create(description: 'Testing', date: '2019-09-26 00:00:00', creator: @user)
  end

  test 'should get events index' do
    get events_path
    assert_response :success
  end

  test 'should get new' do
    sign_in_as(@user)
    get new_event_path
    assert_response :success
  end

  test 'should get show' do
    sign_in_as(@user)
    get event_path(@event)
    assert_response :success
  end

  test 'should redirect create when user not logged in' do
    assert_no_difference 'Event.count' do
      post events_path, params: { event: { description: 'Testing', date: '2019-09-26 00:00:00', creator: @user } }
    end
    assert_redirected_to login_path
  end
end
