class User < ActiveRecord::Base
  has_many :pledges, :foreign_key => 'giver_id'

  has_many :campaigns, :foreign_key => 'receiver_id'
  has_many :pledges, through: :campaigns, :foreign_key => 'receiver_id'

end