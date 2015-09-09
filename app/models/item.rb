class Item < ActiveRecord::Base
<<<<<<< HEAD
=======
    
>>>>>>> dbc6b02f9d4df829d193a7f2c3fa5a6445cb4fa7
    validates :name, :presence => true, length: { maximum: 50 }, uniqueness: true
    # 数値のみ有効
    validates :age, numericality: { only_integer: true } 
end
