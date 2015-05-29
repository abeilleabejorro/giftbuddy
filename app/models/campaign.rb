class Campaign < ActiveRecord::Base
  has_many :pledges
  has_many :givers, through: :pledges
  belongs_to :receiver, :class_name => "User"

  validates :title, presence: true
  validates :receiver_id, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :total, presence: true

  def total_contributed
    self.pledges.sum(:amount)
  end

  def amount_left
    self.total - self.total_contributed 
  end

  def pretty_date
    self.deadline.strftime("%B %d, %Y")
  end

  def days_left
    #86400 seconds in a day
    time_left = self.deadline - Time.now 
    if time_left < -84600
      return 0
    else
      return (time_left / 84600).ceil + 1
    end
  end

  def progress_percent
    if self.complete
      100
    else
      ((self.total_contributed/self.total.to_f) * 100).round
    end
  end

  def complete
    self.total_contributed >= self.total
  end

end
