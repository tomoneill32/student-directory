def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  
  name = gets.chomp
  
  while !name.empty? do
    
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains academy"
  puts "-----------"
end

def print(students)
  puts "Please enter a letter"
  letter = gets.chomp
  puts "The students with names beginning with #{letter} are: "
  students.each { |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0].downcase == letter.downcase}
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)