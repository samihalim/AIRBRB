class Desk < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :price, presence: true, allow_blank: false
  validates :location, presence: true, allow_blank: false
  validates :seats, presence: true, allow_blank: false
  validates :title, presence: true, allow_blank: false
  validates :start_date, presence: true
  validates :end_date, presence: true

  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
