class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :schedule
      t.string :description
      t.string :minutes

      t.timestamps
    end
  end
end
