rucksacks = File.read("rucksack_reorganization_input.txt").split("\n").freeze

items = 'a'.upto('z').to_a + 'A'.upto('Z').to_a 
PRIORITIES = items.zip(1..52).to_h.freeze

total_ruckdsacks_priorities_score = 0

total_three_rucksacks_badge_score = 0

rucksacks.each do |rucksack|
  part1, part2 = rucksack[0..rucksack.size/2-1], rucksack[(rucksack.size/2).. rucksack.size-1]
  common_characters = part1.scan(/[#{part2}]/).uniq
  common_characters.each {|chr|  total_ruckdsacks_priorities_score += PRIORITIES[chr]}
end

puts "Sum of priorities of all items is #{total_ruckdsacks_priorities_score}"

rucksacks.each_slice(3) do |rucksack|
  part1, part2, part3 = rucksack
  common_characters = part1.chars & part2.chars & part3.chars
  common_characters.each {|chr|  total_three_rucksacks_badge_score += PRIORITIES[chr]}
end

puts "Sum of three rucksack priorities as per badge is #{total_three_rucksacks_badge_score}"
