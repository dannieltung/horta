class AddBookToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :book, :date
  end
end
