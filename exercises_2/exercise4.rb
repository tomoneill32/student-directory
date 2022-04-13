@students = []

def add_students(name , cohort = :november)
  @students << {name: name, cohort: :november}
end
  

def input_students
  input_message
  name = STDIN.gets.chomp
  
  while !name.empty? do
    
    add_students(name)
    puts "Now we have #{@students.count} students"

    name = STDIN.gets.chomp
  end

end

def input_message
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
end

def print_header
  puts "The students of Villains academy"
  puts "-----------"
end

def print_students_list
  @students.each { |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)"}   
end

def print_footer
  puts "Overall we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exist?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename,"r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    success_message(selection)
    input_students
  when "2"
    success_message(selection)
    show_students
  when "3"
    success_message(selection)
    save_students
  when "4"
    success_message(selection)
    load_students
  when "9"
    exit
  else
    puts "I'm not sure what you mean, please try again"
  end
end

def success_message(selection)
  puts "You have selected option #{selection}"
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

interactive_menu