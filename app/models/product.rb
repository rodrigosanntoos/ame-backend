class Product < ApplicationRecord
    has_many :sale_products, dependent: :destroy
    has_many :products, :through => :sale_products

    validates_presence_of :name, :amount, :value, :value_smash
end
