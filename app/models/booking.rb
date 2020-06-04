class Booking < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :begin_date, :end_date, presence: true
end
