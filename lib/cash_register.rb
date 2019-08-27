class CashRegister
    attr_accessor :total, :discount
    def initialize(discount=0)
        @total = 0
        @items = []
        @prices = {}
        @discount = discount
    end

    def add_item(item, price, quantity = 1)
        @total = @total + price * quantity
        @prices[item] = price
        quantity.times do
            @items << item
        end
    end

    def apply_discount
        @total = @total*(1-@discount*0.01)
        if @discount == 0
            "There is no discount to apply."
        else 
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        last_price = @prices[@items[-1]]
        @total = @total - last_price
        if @total % last_price == 0
            @total = 0
        end
    end

end