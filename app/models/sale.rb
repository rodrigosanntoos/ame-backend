class Sale < ApplicationRecord
    has_many :sale_products, dependent: :destroy
    has_many :sales, :through => :sale_products
    belongs_to :user

    validates_presence_of :user_id, :address, :number, :reference, :cell_phone, :birthday_name, :year, :number_children, :age_range, :amount_adult, :hour, :date_event, :day_week, :date_final, :freight, :days_collect
end
