class Event < ApplicationRecord
    validates :schedule, presence: true
    validates :description, presence: true
    validates :minutes, presence: false

    has_one :eventsTrackRelation
    has_one :tracks, through: :eventsTrackRelation

    def self.organize_byTrack(rows)
        organization = []
        self.all.limit(rows[:limit]).map do |event|
            organization.push({
                track: event.tracks.session,
                schedule: event.schedule,  
                minutes: event.minutes,
                description: event.description
            })
        end
        organization
    end
end
