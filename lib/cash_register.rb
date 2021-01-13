class CashRegister

    def initialize(employee_discount=0)
        @total = 0
        @discount = employee_discount
        @items = []
        @prices = []
    end

    attr_reader :discount, :items

    attr_accessor :total

    def add_item(item, price, quantity=1)
        @total += (price * quantity)
        quantity.times do
            items.push(item)
        end
        @prices.push(price * quantity)
    end

    def apply_discount
        if @discount != 0
            @total *= ((100 - @discount) * 0.01)
            @total = @total.to_i
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @item_to_remove = @items.pop
        @price_to_remove = @prices.pop
        @total -= @price_to_remove
    end


end
