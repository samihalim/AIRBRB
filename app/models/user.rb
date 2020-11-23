class User < ApplicationRecord
  has_many :desks
  has_many :bookings

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false
end
