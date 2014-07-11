class Ride < ActiveRecord::Base
	has_and_belongs_to_many :users
	validates :airport, :date, presence: true
  validate :date_cannot_be_in_the_past
  
  def date_cannot_be_in_the_past
    errors.add(:flight_time, "can't be in the past") if self.date < Time.now 
  end

	def flight_date 
    self.date.strftime("%B %d %Y")  	
  end

  def flight_time
    self.date.strftime("%I:%M %p")
  end

  def shuttle_time
  	self.ridetime.strftime("%I:%M %p") if self.ridetime.present?
  end
end
