class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.text :description
      t.string :photo_url
      t.datetime :deadline
      t.integer :total

      t.timestamps null: false
    end
  end
end
