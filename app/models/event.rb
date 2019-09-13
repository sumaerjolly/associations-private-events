class Event < ApplicationRecord
    validates :description, presence: true, length: { in: 3..255 }
    belongs_to :creator, class_name: 'User'
end
