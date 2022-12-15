sections = File.read("camp_cleanup_input.txt").split("\n").freeze
total_match = 0
total_overlap = 0

def check_match(section)
  part1, part2 = section.split(",")
  part1_first, part1_second = part1.split("-").map(&:to_i)
  part2_first, part2_second = part2.split("-").map(&:to_i)
  ((part1_first..part1_second).cover?(part2_first..part2_second) || (part2_first..part2_second).cover?(part1_first..part1_second)) ? 1 : 0
end

sections.each do |section|
  total_match += check_match(section)
end

puts "Total number of sections matching are #{total_match}"

def check_overlap(section)
  part1, part2 = section.split(",")
  part1_first, part1_second = part1.split("-").map(&:to_i)
  part2_first, part2_second = part2.split("-").map(&:to_i)
  ((part1_first..part1_second).begin <= (part2_first..part2_second).end && (part1_first..part1_second).end >= (part2_first..part2_second).begin) ? 1 : 0
end

sections.each do |section|
  total_overlap += check_overlap(section)
end

puts "Total number of sections overlap are #{total_overlap}"