class CashRegister
    attr_accessor :total, :discount, :prev_total
    attr_reader :items

    def initialize(discount=nil)
        @total = 0
        @prev_total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity=1)
        self.prev_total = self.total
        self.total += price * quantity
        quantity.times {
            self.items.push(item)
        }
    end

    def apply_discount
        if discount
            self.total = (self.total * (1 - self.discount/100.0)).round
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.items.pop
        self.total = self.prev_total
    end
end
