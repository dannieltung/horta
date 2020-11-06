class BookChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :book, :datetime
  end
end
