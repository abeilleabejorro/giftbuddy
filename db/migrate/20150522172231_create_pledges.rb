class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :amount
      t.references :campaign, index: true

      t.timestamps null: false
    end
    add_foreign_key :pledges, :campaigns
  end
end
