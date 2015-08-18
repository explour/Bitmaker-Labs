class Pizza
	attr_accessor :type, :size, :price

	def initialize (type, size, price)
		@type = type
		@size = size
		@price = price
	end
end