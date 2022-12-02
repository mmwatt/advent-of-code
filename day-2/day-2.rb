# https://adventofcode.com/2022/day/2
WIN_SCORES = { win: 6, draw: 3, lose: 0 }
SHAPE_SCORES = { rock: 1, paper: 2, scissors: 3 }
# move - 1 == win
MOVES = [:rock, :paper, :scissors]
INPUT_MAP = {A: :rock, B: :paper, C: :scissors,
             X: :rock, Y: :paper, Z: :scissors}

def score(opponent_move, my_move)
  return WIN_SCORES[:draw] + SHAPE_SCORES[my_move] if my_move == opponent_move
  result = MOVES[MOVES.find_index(my_move) - 1] == opponent_move ? WIN_SCORES[:win] : WIN_SCORES[:lose]
  result + SHAPE_SCORES[my_move]
end


input = File.read('day-2.txt').split(/\n/)
scores = input.map do |line|
  opponent_letter, my_letter = line.split
  opponent_move = INPUT_MAP[opponent_letter.to_sym]
  my_move = INPUT_MAP[my_letter.to_sym]
  score(opponent_move, my_move)
end

puts scores.sum