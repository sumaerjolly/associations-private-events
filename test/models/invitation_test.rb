# frozen_string_literal: true

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: 'jolly')
    @event = Event.create(description: 'Testing', date: '2019-09-26 00:00:00', creator: @user)
    @invitation = Invitation.new(attendee: @user, attended_event: @event)
  end

  test 'invitation should be valid' do
    assert @invitation.valid?
  end
end
