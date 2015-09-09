class Item < ActiveRecord::Base
    validates :name, :presence => true, length: { maximum: 50 }, uniqueness: true
    # 数値のみ有効
    validates :age, numericality: { only_integer: true } 
end
