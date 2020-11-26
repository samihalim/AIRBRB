class Desk < ApplicationRecord
  has_many :bookings, dependent: :destroy
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

  include PgSearch::Model

  pg_search_scope :search_by_title_location,
    against: [ :title, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
