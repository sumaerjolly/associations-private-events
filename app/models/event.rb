class Event < ApplicationRecord
    validates :description, presence: true, length: { in: 3..255 }
    
    belongs_to :creator, class_name: 'User'

    has_many :invitations, foreign_key: :attended_event_id, dependent: :destroy
    has_many :attendees, through: :invitations

    scope :past, -> { where("date < ?", Time.current) }
    scope :future, -> { where("date > ?", Time.current) }
    
end
