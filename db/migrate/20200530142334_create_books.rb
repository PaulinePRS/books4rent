class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :publishing_year
      t.string :series
      t.integer :rating
      t.string :publisher
      t.references :lender, foreign_key: { to_table: :users }
      t.string :category

      t.timestamps
    end
  end
end
