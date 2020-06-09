class RemovePublishedDateFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :published_date, :integer
  end
end
