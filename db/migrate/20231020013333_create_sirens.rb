# frozen_string_literal: true

class CreateSirens < ActiveRecord::Migration[7.1]
  def change
    create_table :sirens do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.string :incident_type, null: false
      t.string :incident_location, null: false
      t.string :municipality, null: false
      t.string :station
      t.datetime :dispatched_at, null: false

      t.timestamps
    end
  end
end
