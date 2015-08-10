class Pizza
	attr_accessor :size, :toppings, :price

	def initialize
		@size = "Large"
		@toppings = ["Cheese"]
	end

	def attributes
		s = " "
		@toppings.each {|x| s = s + "#{x} "}
		return @size + s + "Pizza"
	end

end

cheese_pizza = Pizza.new
puts cheese_pizza.attributes