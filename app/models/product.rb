class Product < ApplicationRecord
    validates_presence_of :name, :amount, :value_product, :value_unit, :value_smash
end
