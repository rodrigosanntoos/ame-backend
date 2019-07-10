class Sale < ApplicationRecord
    has_many :sale_products, dependent: :destroy
    has_many :products, :through => :sale_products
    belongs_to :user

    validates_presence_of :user_id, :address, :number, :reference, :cell_phone, :birthday_name, :year, :number_children, :age_range, :amount_adult, :hour, :date_event, :day_week, :date_final, :freight, :days_collect

    def create_sale_product params
        value_final = 0
        if params[:products]
            vet = params[:products]
            if vet
                vet.each do |product_sale|
                    product = Product.where(id: product_sale.split("||")[0])
                    if product.length > 0 
                        product = product.last
                        value_final = (value_final+(product.value*product_sale.split("||")[1].to_f))*self.days_collect
                        product.update(amount: (product.amount-product_sale.split("||")[1].to_i))
                        self.sale_products.create(product_id: product.id, amount: product_sale.split("||")[1])
                    end
                end
                self.update(value_final: value_final)
            end
        end
    end

end
