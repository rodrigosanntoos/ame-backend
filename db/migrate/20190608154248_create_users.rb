class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :number
      t.string :apt
      t.string :neighborhood
      t.string :telephone
      t.string :cell_phone
      t.string :name_birthday
      t.integer :number_childrem
      t.integer :number_adult
      t.time :hour_start
      t.time :hour_end
      t.date :date
      t.string :day_week

      t.timestamps
    end
  end
end
