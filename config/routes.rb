Rails.application.routes.draw do
  get '/birds' => 'birds#index'
end

class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.references :bird, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
create_table "sightings", force: :cascade do |t|
  t.integer "bird_id"
  t.integer "location_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["bird_id"], name: "index_sightings_on_bird_id"
  t.index ["location_id"], name: "index_sightings_on_location_id"
end
class Sighting < ApplicationRecord
  belongs_to :bird
  belongs_to :location
end
