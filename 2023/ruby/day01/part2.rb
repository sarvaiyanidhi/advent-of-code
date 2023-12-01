def convert_to_number(word)
  # Mapping of words to digits
  word_to_digit = {
    'one' => '1',
    'two' => '2',
    'three' => '3',
    'four' => '4',
    'five' => '5',
    'six' => '6',
    'seven' => '7',
    'eight' => '8',
    'nine' => '9'
  }

  # Convert word to digit or use the original word
  digit = word_to_digit[word.downcase] || word
  digit.to_i
end

# Open the input file
input_file = File.open("input.txt", "r")

# Initialize the sum of calibration values
sum_calibration_values = 0

# Process each line in the input file
input_file.each_line do |line|
  # Find matches in the line (including number words and digits)
  matched_elements = line.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).flatten
  mapped_elements = matched_elements.map { |element| convert_to_number(element) }

  # Add the first and last occurrences to the sum
  sum_calibration_values += (mapped_elements.first.to_s + mapped_elements.last.to_s).to_i
end

# Close the input file
input_file.close

# Output the sum of calibration values
puts "Sum of Calibration Values: #{sum_calibration_values}"
