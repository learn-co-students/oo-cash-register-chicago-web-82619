class CashRegister

    attr_accessor :total, :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
    
    def add_item(title, price, quantity = 0)
        quantity > 0 ? self.total += price * quantity : self.total += price 
        quantity > 0 ? quantity.times { self.items.push(title) } : self.items << title
        quantity > 0 ? @lastTransaction = price * quantity : @lastTransaction = price
    end     
    
    def apply_discount
        if self.discount > 0
            self.total = self.total - (self.total * self.discount/100)
            "After the discount, the total comes to $#{self.total}." 
        else
            "There is no discount to apply."
        end        
    end
    
    def void_last_transaction
        self.total -= @lastTransaction
        
    end    

end    
