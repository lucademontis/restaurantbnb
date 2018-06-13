class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def total_price
    number_of_days = self.end_date - self.start_date
    n = number_of_days.to_i
   total_price = self.restaurant.price *  self.number_of_people * n
  end

end



