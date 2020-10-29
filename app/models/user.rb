class User < ApplicationRecord
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'

  validates :name, :username, presence: true
  validates :username, uniqueness: true
end
