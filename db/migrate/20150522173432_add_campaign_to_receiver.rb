class AddCampaignToReceiver < ActiveRecord::Migration
  def change
    add_column :campaigns, :receiver_id, :integer
  end
end
