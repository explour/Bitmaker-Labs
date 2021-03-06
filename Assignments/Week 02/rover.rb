class Rover
	attr_accessor :x, :y, :direction

	def initialize
		@x = 0
		@y = 0
		@direction = "N"
	end

	#Is thie alternative method writing good practice in Ruby? I remember it in another language. 
	def initialize (x, y, direction)
		@x = x
		@y = y
		@direction = direction
	end

	def read_instruction (instruction_string)
		puts "Starting Location: #{x}, #{y} Direction: #{direction}"

		instruction_string.each_char do |command|
			case command
			when "M" then move
			when "L" then turn("L")
			when "R" then turn("R")
			else "#{command} is not a valid command. It is ignored in this sequence."
			end
		end

		puts "Ending Location: #{x}, #{y} Direction: #{direction}"
	end

	private
	def move
		case direction
		when "N" then @y += 1
		when "W" then @x -= 1
		when "S" then @y -= 1
		when "E" then @x += 1
		end
	end

	def turn (direction_input)
		case direction_input
		when "L"
			case direction
			when "N" then @direction = "W"
			when "W" then @direction = "S"
			when "S" then @direction = "E"
			when "E" then @direction = "N"
			end
		when "R"
			case direction
			when "N" then @direction = "E"
			when" W" then @direction = "N"
			when "S" then @direction = "W"
			when "E" then @direction = "S"
			end
		end

	end
end


curiosity = Rover.new(1, 2, "N")
curiosity.read_instruction("LMMMM")