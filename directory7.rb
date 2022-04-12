def input_students
  months = [:january, :february, :march, :april, :may, :june, 
    :july, :august, :september, :october, :november, :december]
  puts "Please enter the names and details of the students"
  puts "To finish, just hit return with the name field blank"

  students = []
  puts "New student name?"
  name = gets.chomp
  
  while !name.empty? do
    puts "#{name}'s height in cm?"
    height = gets.chomp.to_f
    
    puts "#{name}'s cohort group? (Leave blank if November)"
    while true do
      cohort = gets.chomp.downcase.to_sym
      cohort = :november if cohort.empty?
      months.include?(cohort) ? break : puts("Please enter a valid month:")
    end
    students << {name: name, cohort: cohort, height: height}
    puts "Now we have #{students.count} students"
    puts "New student name?"
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains academy"
  puts "-----------"
end

def print(students)
  students.each_with_index { |student,index| 
    puts "#{index + 1}. #{student[:name]}, #{student[:cohort].capitalize} cohort, height: #{student[:height]}cm".center(80)}
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)