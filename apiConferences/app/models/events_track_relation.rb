class EventsTrackRelation < ApplicationRecord
  belongs_to :track
  belongs_to :event
end
