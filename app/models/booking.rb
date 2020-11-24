class Booking < ApplicationRecord
  belongs_to :desk
  belongs_to :user # only for renter

  validates :start_date, presence: true
  validates :end_date, presence: true
end
