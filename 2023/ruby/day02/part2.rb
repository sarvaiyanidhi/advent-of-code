def calculate_power(game_recordings)
  powers = []

  game_recordings.each do |game|
    max_counts = {}

    game.split(';').each do |turn|
      turn.scan(/(\d+)\s+(\w+)/).each do |count, color|
        count = count.to_i
        max_counts[color] = [max_counts[color].to_i, count].max
      end
    end

    power = max_counts['red'] * max_counts['green'] * max_counts['blue']
    powers << power
  end

  return powers.sum
end

game_recordings = File.readlines('input.txt').map(&:chomp)

result = calculate_power(game_recordings)

puts "Result: #{result}"
