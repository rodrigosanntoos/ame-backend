class AddDetailsToSaleProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_products, :amount, :integer
  end
end
