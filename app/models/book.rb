class Book < ApplicationRecord
  belongs_to :lender, class_name: "User"
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :title, length: { minimum: 2 }, presence: true
  validates :author, length: { minimum: 2 }, presence: true
  validates :publisher, length: { minimum: 2 }, presence: true
  validates :category, length: { minimum: 2 }, presence: true
  validates :rating, inclusion: { in: (1..5) }, presence: true
  validates :published_date, presence: true
end
