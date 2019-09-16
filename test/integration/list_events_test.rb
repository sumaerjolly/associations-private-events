# frozen_string_literal: true

require 'test_helper'

class ListEventsTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: 'jolly')
    @event = Event.create(description: 'Testing', date: '2019-09-26 00:00:00', creator: @user)
    @event1 = Event.create(description: 'Description', date: '2019-09-26 00:00:00', creator: @user)
  end

  test 'should show categories listing' do
    get events_path
    assert_template 'events/index'
    assert_match 'Testing', response.body
    assert_match 'Description', response.body
  end
end
