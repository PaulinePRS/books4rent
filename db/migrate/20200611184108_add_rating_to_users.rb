class AddRatingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rating, :string
  end
end
