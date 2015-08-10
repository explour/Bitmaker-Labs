#1. How would you calculate a good tip for a 55 dollar meal?
TIP_PERCENTAGE = 0.20
puts "How much was your meal today?"
amount = gets.chomp.to_f
puts "You should tip around $#{(amount*TIP_PERCENTAGE).round}."

#2. Try adding a string and an integer. What happens?
#puts "5" + 5
puts "5".to_i + 5

#3. Evidently, Ruby is much more than just a calculator...
puts "45628 multiplied by 7839 equals #{45628*7829}."

#4. What's the value of the expression...?
puts true == (true && false) || (false && true) || !(false && false)