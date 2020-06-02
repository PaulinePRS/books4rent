class ChangeBooks < ActiveRecord::Migration[6.0]
  def change
    change_table :books do |t|
      t.remove :series
      t.text :description
      t.rename :publishing_year, :published_date
  end
end
