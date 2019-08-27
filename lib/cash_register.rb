class CashRegister

attr_accessor :total
attr_accessor :items
attr_reader :discount
attr_accessor :transactions


  def initialize(discount=0)
    @total = 0.0
    @items = []
    @transactions = []
    @discount = discount
  end

  def add_item(title, price, quantity=1)

      transaction_amount = price*quantity
      self.total += transaction_amount
      quantity.times do
        self.items << title
      end

      self.transactions << [transaction_amount, quantity]


  end

  def apply_discount
    if self.discount > 0
      self.total -= self.total* self.discount.to_f/100
      "After the discount, the total comes to $#{self.total.to_i}."

    else
      "There is no discount to apply."
    end

  end

  def void_last_transaction
    last_transaction = self.transactions.pop
    last_cost = last_transaction[0]
    last_quantity = last_transaction[1]
    last_quantity.times {self.items.pop}
    self.total -= last_cost
    self.total = 0.0 if self.items.length < 1
  end

end
