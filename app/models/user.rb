class User < ActiveRecord::Base
  has_many :pledges, :foreign_key => 'giver_id'

  has_many :campaigns, :foreign_key => 'receiver_id'
  has_many :pledges, through: :campaigns, :foreign_key => 'receiver_id'
  has_secure_password

  def pending_campaigns
    self.campaigns.where(status: "Pending")
  end

  def connected_to_stripe?
    !!self.stripe_user_id
  end

end