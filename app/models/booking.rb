class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  
  validates :number_of_people, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate  :dates
  # validates :end_date, presence: true, end_date: { after_or_equal_to:  :start_date}

  def dates
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    elsif end_date < start_date
      errors.add(:end_date, "cannot be before start date")
    end
  end

  def total_price
    number_of_days = self.end_date - self.start_date
    n = number_of_days.to_i
   total_price = self.restaurant.price *  self.number_of_people * n
  end
end



