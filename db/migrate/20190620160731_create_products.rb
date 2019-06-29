class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :amount
      t.float :value_product
      t.float :value_unit
      t.float :value_smash

      t.timestamps
    end
  end
end
