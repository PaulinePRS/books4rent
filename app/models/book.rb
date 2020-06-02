class Book < ApplicationRecord
  belongs_to :lender, class_name: "User"
  has_many :reviews, dependent: :destroy
end
