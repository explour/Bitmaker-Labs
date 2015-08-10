class Item
	$TYPES_OF_GOODS = ["Books", "Food", "Medical Products", "Music", "CPG", "Other"]
	$EXEMPT_GOODS = ["Books", "Food", "Medical Products"]
	attr_accessor :name
	attr_reader :type, :is_imported, :price

	def initialize (name)
		@name = name
	end

	#Is there a better approach for validating these variables?
	def type=(new_type)
		if $TYPES_OF_GOODS.include?(new_type)
			@type = new_type
		else
			puts "#{new_type} is not a valid type of good."
		end
	end

	def is_imported=(new_is_imported)
		if new_is_imported == true || new_is_imported == false
			@is_imported = new_is_imported
		else
			puts "Import status needs to be a boolean value."
		end
	end

	def price=(new_price)
		if new_price.is_a? Numeric
			@price = new_price.to_f
		else
			puts "Price must be a number."
		end
	end

end

class Cart
	SALES_TAX = 0.10
	IMPORT_TAX = 0.05
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
		if !item.is_a? Item
			puts "The first input must be an Item Object"
		elsif !quantity.is_a? Integer
			puts "The second input must be a positive integer"
		else	
			@cart_contents << [item, quantity]
		end
	end

	def show_contents()
		puts "#{name}:"
		cart_contents.each do |item|
			if item[0].is_imported == true
				puts "#{item[1]} imported #{item[0].name} at $#{item[0].price.round(2)}"
			else
				puts "#{item[1]} #{item[0].name} at $#{item[0].price.round(2)}"
			end 
		end
		puts nil
	end


	def print_receipt()
		calculate_subtotal
		calculate_tax
		calculate_total

		puts "#{name}:"
		cart_contents.each do |item|
			#Is there a shorter way of combining the if statement into one line?
			if item[0].is_imported == true
				puts "#{item[1]} imported #{item[0].name} : $#{item[0].price.round(2)}"
			else
				puts "#{item[1]} #{item[0].name} : $#{item[0].price.round(2)}"
			end 
		end
		puts "Subtotal: $#{subtotal.round(2)}"
		puts "Sales taxes: $#{total_tax.round(2)}"
		puts "Total: $#{total.round(2)}"
		puts nil
	end

	private
	def calculate_subtotal
		cart_contents.each { |item| @subtotal = subtotal + item[0].price * item[1]}
	end

	def calculate_tax
		cart_contents.each do |item|
			@total_tax = total_tax + item[0].price * SALES_TAX if !$EXEMPT_GOODS.include?(item[0].type)
			@total_tax = total_tax + item[0].price * IMPORT_TAX if item[0].is_imported == true
		end
	end

	def calculate_total
		@total = total_tax + subtotal
	end

end

cart1 = Cart.new

a = Item.new("book")
a.type = "Books"
a.is_imported = false
a.price = 12.49

b = Item.new("music CD")
b.type = "Music"
b.is_imported = false
b.price = 14.99

c = Item.new("chocolate bar")
c.type = "Food"
c.is_imported = false
c.price = 0.85

cart1.add(a, 1)
cart1.add(b, 1)
cart1.add(c, 1)

cart2 = Cart.new

d = Item.new("box of chocolates")
d.type = "Food"
d.is_imported = true
d.price = 10.50

e = Item.new("bottle of perfume")
e.type = "CPG"
e.is_imported = true
e.price = 47.50

cart2.add(d, 1)
cart2.add(e, 1)

cart3 = Cart.new

f = Item.new("bottle of perfume")
f.type = "CPG"
f.is_imported = true
f.price = 32.19

g = Item.new("bottle of perfume")
g.type = "CPG"
g.is_imported = false
g.price = 20.89

h = Item.new("packet of headache pills")
h.type = "Medical Products"
h.is_imported = false
h.price = 9.75

i = Item.new("box of chocolates")
i.type = "Food"
i.is_imported = true
i.price = 11.85

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