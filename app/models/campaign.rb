class Campaign < ActiveRecord::Base
  has_many :pledges
  has_many :givers, through: :pledges
  belongs_to :receiver, :class_name => "User"
end
