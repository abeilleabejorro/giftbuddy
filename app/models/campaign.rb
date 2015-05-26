class Campaign < ActiveRecord::Base
  has_many :pledges
  has_many :givers, through: :pledges
  belongs_to :receiver, :class_name => "User"


  def total_contributed
    self.pledges.sum(:amount)
  end

  def amount_left
    self.total - self.total_contributed 
  end

  def pretty_date
    self.deadline.strftime("%B %d, %Y")
  end
end
