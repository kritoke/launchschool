INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +   # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +   # cols
                [[1, 5, 9], [3, 5, 7]]                # diagonals

def prompt(msg)
  puts msg
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.'"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def player_move!(brd)
  prompt "Choose a square (#{joinor(empty_squares(brd), ', ')}):"
  square = gets.chomp.to_i
  until empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
  end
  square
end

def computer_move!(brd)
  empty_squares(brd).sample
end

def make_move!(current_player, brd)
  case current_player
  when 'Player'
    brd[player_move!(brd)] = PLAYER_MARKER
  when 'Computer'
    brd[computer_move!(brd)] = COMPUTER_MARKER
  end
  display_board(brd)
end

def joinor(brd_array, punctuation = ', ', conjunction = 'or')
  brd_array[-1] = "#{conjunction} #{brd_array.last}" if brd_array.size > 1
  brd_array.size == 2 ? brd_array.join(' ') : brd_array.join(punctuation)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def play_again?
  prompt "Play again? (y or n)"
  gets.chomp.downcase
end

def update_high_score(score, brd)
  case detect_winner(brd)
  when 'Player'
    score[:player] += 1
  when 'Computer'
    score[:computer] += 1
  end
end

continue = 'y'
score = { player: 0, computer: 0 }
until continue != 'y'
  until score.fetch(:player) == 5 || score.fetch(:computer) == 5 ||
        continue != 'y'
    board = initialize_board
    display_board(board)

    until someone_won?(board) || board_full?(board)
      make_move!("Player", board)
      make_move!("Computer", board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won this round!"
      update_high_score(score, board)
    else
      prompt "It's a tie!"
    end
    p score
    if score[:player] == 5
      prompt "Congradulations, you won the game against the computer!"
    elsif score[:computer] == 5
      prompt "Sorry, you lost the game to a computer!"
    end
    continue = play_again?
  end
  score = { player: 0, computer: 0 }
end
