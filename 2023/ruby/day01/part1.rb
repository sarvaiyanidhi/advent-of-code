def extract_first_and_last_digits(str)
  # Extract the first and last digits
  first_digit = str.scan(/\d/).first.to_i
  last_digit = str.scan(/\d/).last.to_i % 10
  
  # Concatenate the first and last digits as strings
  concatenated_digits = first_digit.to_s + last_digit.to_s
  
  return concatenated_digits.to_i
end

# Read strings from the input file
file_path = "input.txt"
strings = File.readlines(file_path, chomp: true)

# Concatenate first and last digits as strings and sum them up
sum = strings.map { |str| extract_first_and_last_digits(str) }.sum

puts "sum of all of the calibration values: #{sum}"