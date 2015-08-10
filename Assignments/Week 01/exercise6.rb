grocery_list = ["carrots", "toilet paper", "apples", "salmon"]

def print_list (list)
	list.each { |x| puts "* #{x}"}
	puts ""
end

#1
print_list(grocery_list)

#2
grocery_list << "rice"
print_list(grocery_list)

#3
puts grocery_list.length

#4
puts grocery_list.include?("bananas") ? "You need to pick up bananas." : "You don't need to pick up bananas today."

#5
puts grocery_list [1]

#6
grocery_list.sort!
print_list(grocery_list)

#7
grocery_list.delete("salmon")
print_list(grocery_list)