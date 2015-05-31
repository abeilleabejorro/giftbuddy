class User < ActiveRecord::Base
  has_many :pledges, :foreign_key => 'giver_id'

  has_many :campaigns, :foreign_key => 'receiver_id'
  # has_many :pledges, through: :campaigns, :foreign_key => 'receiver_id'
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true


  def pending_campaigns
    self.campaigns.where(status: "Pending")
  end

  def connected_to_stripe?
    !!self.stripe_user_id
  end

  def live_campaigns
    self.campaigns.where(status: "Live")
  end

  def pledges_given
    Pledge.where(giver_id: self.id)
  end
  def campaigns_donated_to
    pledges_given.map{|pledge| pledge.campaign}.uniq
  end

end