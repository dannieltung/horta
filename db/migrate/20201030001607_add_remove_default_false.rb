class AddRemoveDefaultFalse < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :remove, :boolean, default: false
  end
end
