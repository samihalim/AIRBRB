class Booking < ApplicationRecord
  belongs_to :desk
  belongs_to :user
end
