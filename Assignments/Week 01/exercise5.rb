def F_to_C (temp_in_f)
	temp_in_c = ((temp_in_f.to_f - 32) * 5 / 9).round(1)
	puts "#{temp_in_f} degrees Fahrenheit is #{temp_in_c} degrees in Celsius"
	return temp_in_c
end

F_to_C(100)