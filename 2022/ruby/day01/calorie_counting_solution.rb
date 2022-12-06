calories = File.read("calorie_counting_input.txt").split("\n\n").map{|cal| cal.split("\n").map(&:to_i).sum}
max_calorie = calories.max
puts "Max calorie carried by Elf - #{max_calorie}"
total_top_three_calories = calories.sort.reverse[0..2].sum
puts "Sum of total calories carried by top three Elf - #{total_top_three_calories}"