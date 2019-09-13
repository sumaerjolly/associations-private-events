class User < ApplicationRecord
    before_save {self.name = name.downcase }
    validates :name, presence: true, length: { in: 3..20 }, uniqueness: { case_sensitive: false }
    has_many :events, foreign_key: :creator_id, dependent: :destroy
end
