students = {
	cohort1: 34,
	cohort2: 42,
	cohort3: 22
}

#1
def display (cohort_list)
	cohort_list.each {|x,y| puts "#{x}: #{y} students"}
end

#2
students[:cohort4] = 43

#3
puts students.keys

#4
students.each {|x,y| students[x] = y*1.05}
display(students)

#5
students.delete(:cohort2)
display(students)

#6
total_students = 0
students.each {|x,y| total_students += y}
puts total_students