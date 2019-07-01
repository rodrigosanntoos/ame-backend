class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.integer :number
      t.string :telephone
      t.string :cell_phone
      t.string :complement

      t.timestamps
    end
  end
end
