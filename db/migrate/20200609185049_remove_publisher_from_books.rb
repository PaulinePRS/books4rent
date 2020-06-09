class RemovePublisherFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :publisher, :string
  end
end
