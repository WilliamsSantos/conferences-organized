class CreateEventsTrackRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :events_track_relations do |t|
      t.references :track, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
