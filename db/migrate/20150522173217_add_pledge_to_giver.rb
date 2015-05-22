class AddPledgeToGiver < ActiveRecord::Migration
  def change
    add_column :pledges, :giver_id, :integer
  end
end
