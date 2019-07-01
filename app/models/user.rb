class User < ApplicationRecord
    has_many :sales, dependent: :destroy

    validates_presence_of :name, :address, :number, :telephone, :cell_phone, :complement
end
