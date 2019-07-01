class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.integer :number
      t.integer :apt
      t.string :complement
      t.string :reference
      t.string :phone
      t.string :cell_phone
      t.string :birthday_name
      t.integer :year
      t.integer :number_children
      t.string :age_range
      t.integer :amount_adult
      t.string :hour
      t.date :date_event
      t.string :day_week
      t.date :date_final
      t.float :freight
      t.integer :days_collect
      t.float :value_final

      t.timestamps
    end
  end
end
