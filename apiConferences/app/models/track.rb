class Track < ApplicationRecord
    validates :session, presence: true

    has_many :eventsTrackRelation
    has_many :events, through: :eventsTrackRelation
end
