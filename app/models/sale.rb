class Sale < ApplicationRecord
    has_many :sale_products, dependent: :destroy
    has_many :sales, :through => :sale_products
    belongs_to :user

    validates_presence_of :user_id, :address, :number, :reference, :cell_phone, :birthday_name, :year, :number_children, :age_range, :amount_adult, :hour, :date_event, :day_week, :date_final, :freight, :days_collect

    def create_sale_product params
        vet = params[:products].split("||")
        if vet
            vet.each do |product_sale|
                product = Product.where(id: product_sale[0])
                if product.length > 0 
                    self.sale_products.create(product_id: product.last.id, amount: product_sale[1])
                end
            end
        end
    end

end
