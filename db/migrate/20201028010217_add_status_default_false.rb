class AddStatusDefaultFalse < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :status, :boolean, default: false
  end
end
