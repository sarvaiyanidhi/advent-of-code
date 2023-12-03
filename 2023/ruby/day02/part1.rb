def find_matching_games(game_recordings, available_cubes)
  matching_games = []

  game_recordings.each do |game|
    valid_game = true

    # Extract game number from the game string
    game_number = game.match(/Game (\d+):/)[1].to_i

    game.split(';').each do |turn|
      turn.scan(/(\d+)\s+(\w+)/).each do |count, color|
        count = count.to_i
        if count > available_cubes[color]
          valid_game = false
        end
      end
    end

    if valid_game
      matching_games << game_number
    end
  end

  return matching_games
end

# Read game recordings from input.txt
game_recordings = File.readlines('input.txt').map(&:chomp)

available_cubes = { 'red' => 12, 'green' => 13, 'blue' => 14 }

matching_games = find_matching_games(game_recordings, available_cubes)

# Calculate the sum of matching games
sum_of_matching_games = matching_games.sum

puts "Matching games: #{matching_games.join(', ')}"
puts "Sum of matching games: #{sum_of_matching_games}"
