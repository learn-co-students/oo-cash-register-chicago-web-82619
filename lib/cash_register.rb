require "pry"
class CashRegister
    attr_accessor :discount, :total, :last, :quantity
    def initialize(discount=100)
        @total = 0
        @discount = discount
        @items = []
    end
    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times do
            @items << title
        end
        @last = price * quantity
        @quantity = quantity
    end
    def apply_discount
        @total -= (@total*(@discount/100.0))
        if @discount == 100
            p "There is no discount to apply."
        else
            p "After the discount, the total comes to $#{@total.floor}."
        end
    end
    def items
        @items
    end
    def void_last_transaction
        @quantity.times do
            @items.pop()
        end
        @total -= @last
        binding.pry
        if @items.length == 0
            @total = 0
        end
    end
end

