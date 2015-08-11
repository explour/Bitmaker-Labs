class Product
	@@sales_tax = 0.10
	attr_accessor :name, :price
	attr_reader :tax

	def initialize(name, price)
		@name = name
		@price =price
		@tax = price * @@sales_tax
	end

end

class ExemptProduct < Product
	def initialize(name, price)
		@name = name
		@price =price
		@tax = 0
	end
end

class ImportedProduct < Product
	@@import_tax = 0.05
	def initialize(name, price)
		@name = name
		@price =price
		@tax = price * (@@sales_tax + @@import_tax)
	end
end

class Cart
	@@counter = 0
	attr_reader :subtotal, :total_tax, :total, :cart_contents, :name

	def initialize
		@@counter = @@counter + 1
		@name = "Cart " + @@counter.to_s
		@cart_contents = []
		@subtotal = 0
		@total_tax = 0
		@total = 0
	end

	def add (item, quantity)
		if !item.is_a? Product
			puts "The first input must be a Product Object"
		elsif !quantity.is_a?(Integer) && quantity > 0
			puts "The second input must be a positive integer"
		else	
			@cart_contents << [item, quantity]
		end
	end

	def show_contents()
		puts "#{name}:"
		cart_contents.each do |item|
			puts "#{item[1]} #{item[0].is_a?(ImportedProduct) ? "imported " : ""}#{item[0].name} at $#{item[0].price.round(2)} "
		end
		puts nil
	end


	def print_receipt()
		puts "#{name}:"
		cart_contents.each do |item|
			@subtotal = subtotal + item[0].price
			@total_tax = total_tax + item[0].tax
			puts "#{item[1]} #{item[0].is_a?(ImportedProduct) ? "imported " : ""}#{item[0].name} : $#{item[0].price.round(2)} "
		end
		@total = subtotal + total_tax
		puts "Subtotal: $#{subtotal.round(2)}"
		puts "Sales taxes: $#{total_tax.round(2)}"
		puts "Total: $#{total.round(2)}"
		puts nil
	end
end

cart1 = Cart.new
a = ExemptProduct.new("book", 12.49)
b = Product.new("music CD", 14.99)
c = ExemptProduct.new("chocolate bar", 0.85)
cart1.add(a, 1)
cart1.add(b, 1)
cart1.add(c, 1)

cart2 = Cart.new
d = ImportedProduct.new("box of chocolates", 10.50)
e = ImportedProduct.new("bottle of perfume", 47.50)
cart2.add(d, 1)
cart2.add(e, 1)

cart3 = Cart.new
f = ImportedProduct.new("bottle of perfume", 32.19)
g = Product.new("bottle of perfume", 18.99)
h = ExemptProduct.new("packet of headache pills", 9.75)
i = ImportedProduct.new("box of chocolates", 11.85)
cart3.add(f, 1)
cart3.add(g, 1)
cart3.add(h, 1)
cart3.add(i, 1)

cart1.show_contents
cart2.show_contents
cart3.show_contents
cart1.print_receipt
cart2.print_receipt
cart3.print_receipt