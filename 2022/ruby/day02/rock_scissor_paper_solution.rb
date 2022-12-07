rounds = File.read("rock_scissor_paper_round_input.txt").split("\n").freeze

ITEMS_SCORE = {rock: 1, paper: 2, scissors: 3}.freeze
GAME_SCORE = {loss: 0, win: 6, draw: 3}.freeze
OPPONENT_ITEMS = {"A" => :rock, "B" => :paper, "C" => :scissors}.freeze
MY_ITEMS = {"X" => :rock, "Y" => :paper, "Z" => :scissors}.freeze
total_score = 0

STRATEGIES =
{
  rock: {rock: :draw, scissors: :loss, paper: :win},
  paper: {paper: :draw, scissors: :win, rock: :loss},
  scissors: {scissors: :draw, paper: :loss, rock: :win}
}.freeze

def game_result(player1, player2)
  player1_item = OPPONENT_ITEMS[player1]
  player2_item = MY_ITEMS[player2]
  STRATEGIES[player1_item][player2_item]
end

rounds.each {|round|
  oponent_player_item, my_item = round.split(" ")
  result = game_result(oponent_player_item, my_item)
  total_score += ITEMS_SCORE[MY_ITEMS[my_item]] + GAME_SCORE[result]
}

puts "Total score for the rounds - #{total_score}"


