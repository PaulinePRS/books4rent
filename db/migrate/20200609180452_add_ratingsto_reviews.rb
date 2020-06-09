class AddRatingstoReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :ratings, :integer
  end
end
