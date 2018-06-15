class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true

  validates :price, presence: true

  include PgSearch
  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
