class Book < ApplicationRecord
  belongs_to :lender, class_name: "User"
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  validates :title, length: { minimum: 2 }, presence: true
  validates :author, length: { minimum: 2 }, presence: true
  validates :category, length: { minimum: 2 }, presence: true

  validates :photo, presence: true

end

