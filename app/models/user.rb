# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :username, presence: true, length: { in: 3..20 }, uniqueness: { case_sensitive: false }
  has_many :events, foreign_key: :creator_id, dependent: :destroy

  has_many :invitations, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :invitations

  def except_current_user(users)
    users.reject { |user| user.id == id }
  end
end
