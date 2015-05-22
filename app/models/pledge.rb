class Pledge < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :giver, :class_name => "User"
end
