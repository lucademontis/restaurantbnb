class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true

end
