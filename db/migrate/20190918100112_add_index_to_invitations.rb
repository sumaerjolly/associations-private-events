# frozen_string_literal: true

class AddIndexToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_index :invitations, :attendee_id
    add_index :invitations, :attended_event_id
  end
end
