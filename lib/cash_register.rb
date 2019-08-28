class CashRegister
    attr_accessor :total, :last_transaction_amount
    attr_reader :discount   

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)

        quantity.times do 
            @items << title
        end
        @total += price*quantity
        @last_transaction_amount = price * quantity
        @total
    end

    def apply_discount

        if @discount
            discountPercentage = @discount / 100.00
            self.total = self.total - self.total * discountPercentage
            "After the discount, the total comes to $#{@total.to_i}."
        else 
            # @total
            "There is no discount to apply."
        end
    end

    def items
        @items
    end 

    def void_last_transaction()
        @total -= @last_transaction_amount
    end  
end
