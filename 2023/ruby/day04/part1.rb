def calculate_points(total_common_numbers)
  points = 0

  puts total_common_numbers

  total_common_numbers.times do |match_number|
    if match_number == 0
      points = 1
    else
      points = 2**match_number
    end
  end

  points
end

def process_card(input)
  card_number_1, card_number_2 = input.match(/Card\s+\d+: (.+?) \| (.+)/).captures
  card_number_1 = card_number_1.split.map(&:to_i)
  card_number_2 = card_number_2.split.map(&:to_i)

  common_numbers = card_number_1 & card_number_2
  total_common_numbers = common_numbers.length
  points = calculate_points(total_common_numbers)

  puts "Total Common Numbers: #{total_common_numbers}"
  puts "Points: #{points}"

  points
end

file_path = 'input.txt'
total_sum = 0

File.readlines(file_path).each do |line|
  if line.match(/Card\s+\d+: /)
    total_sum += process_card(line)
    puts '-' * 20  # Separator between cards
  end
end

puts "Total Sum: #{total_sum}"
