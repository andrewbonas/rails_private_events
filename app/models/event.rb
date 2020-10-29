class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'

    validates :title, :description, :date, presence: true

    scope :upcoming_events, -> { where('date > ?', DateTime.now) }
end
