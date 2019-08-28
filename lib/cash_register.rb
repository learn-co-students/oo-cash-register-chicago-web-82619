class CashRegister
    attr_accessor :total, :last_transaction_amount
    attr_reader :discount   

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)

        if quantity>1
            i=0
            while i<quantity
              @items << title
              i+=1
            end
          else
            @items << title
          end
          @total += price*quantity
          @last_transaction_amount = price*quantity
          @total
    end

    def apply_discount

        if @discount == 20
            discountPercentage = @discount / 100.00
            @total = @total - @total * discountPercentage
            "After the discount, the total comes to $#{@total.to_i}."
        else 
            @total
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
