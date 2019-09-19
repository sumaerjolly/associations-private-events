# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = @user = User.create(username: 'jolly')
    @event = Event.new(description: 'Testing', date: '2019-09-26 00:00:00', creator: @user)
  end

  test 'event should be valid' do
    assert @event.valid?
  end

  test 'description should be present' do
    @event.description = ' '
    assert_not @event.valid?
  end

  test 'description should not be too long' do
    @event.description = 'a' * 256
    assert_not @event.valid?
  end

  test 'description should not be too short' do
    @event.description = 'aa'
    assert_not @event.valid?
  end
end
