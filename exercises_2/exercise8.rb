File.open("exercise8.rb", "r") do |file|
  file.readlines.each do |line|
    puts line
  end
end