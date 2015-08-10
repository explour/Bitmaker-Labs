class Person
	attr_accessor :name

	def initialize (name)
		@name = name
	end

	def greet
		puts "Hi, my name is #{name}."
	end

end

class Student < Person

	def learn
		puts "I get it!"
	end

end

class Instructor < Person

	def teach
		puts "Everything in Ruby is an Object"
	end

end

chris = Instructor.new ("Chris")
chris.greet

cristina = Student.new ("Cristina")
cristina.greet

chris.teach
cristina.learn

#chris.learn
#cristina.teach
#The Learn method is only available for Student objects, and the Teach method is only available for Instructor objects.