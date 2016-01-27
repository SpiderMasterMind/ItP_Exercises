
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMP_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

score = { player: 0, computer: 0 }
current_player = ''

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "NOUGHTS AND CROSSES: FIRST TO 3 WINS!"
  puts "====================================="
  puts "You're a #{PLAYER_MARKER}, computer is a #{COMP_MARKER}"
  puts ' '
  puts '      |      |'
  puts "  #{brd[1]}   |  #{brd[2]}   |  #{brd[3]}"
  puts ' 1    | 2    |3'
  puts '--------------------'
  puts '      |      |'
  puts "  #{brd[4]}   |  #{brd[5]}   |  #{brd[6]}"
  puts ' 4    | 5    |6'
  puts '--------------------'
  puts '      |      |'
  puts "  #{brd[7]}   |  #{brd[8]}   |  #{brd[9]}"
  puts ' 7    | 8    |9'
end

def who_goes_first
  prompt "Who goes first? 1. You 2. Comp 3. Random"
  first = gets.chomp.to_s
  if first == '1'
    "player"
  elsif first == '2'
    "computer"
  else
    random_player
  end
end

def random_player
  current_player = %w(player computer).sample
end

def alternate_player(current_player)
if current_player == 'player'
 "computer"
elsif current_player == 'computer'
 "player"
end
end

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def joinor(brd, delimiter, word = 'or')
  brd.insert(-2, word) if brd.size > 1
  brd.join(delimiter)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def places_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd), ', ')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'Invalid choice'
  end
  brd[square] = PLAYER_MARKER
end

def find_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2 
    board.select{ |position, marker| line.include?(position) && marker == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line| # find offensive position
    square = find_square(line, brd, COMP_MARKER)
    break if square
  end
 
  if !square
    WINNING_LINES.each do |line| # find defensive position
      square = find_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square && brd[5] == ' ' # go to middle
    square = 5
  end
  
  if !square # go anywhere else randomly
    square = empty_squares(brd).sample 
  end
  
  brd[square] = COMP_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMP_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_score(winner, score)
  if winner == 'Player'
    score[:player] += 1
  elsif winner == 'Computer'
    score[:computer] += 1
  end
end

def reset_score!(score)
  score[:player] = 0
  score[:computer] = 0
end

def match_score_reached?(score)
  score[:player] == 3 || score[:computer] == 3
end

def display_game_winner(score)
  if score[:player] > score[:computer]
    prompt "You win the match!"
  else
    prompt "You lost the match!"
  end
end

def game_loop(board, current_player)
  loop do
    display_board(board)
    places_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end
end

loop do
  until match_score_reached?(score)
        
    board = initialise_board
    current_player = who_goes_first

    game_loop(board, current_player)
    
    display_board(board)
    
    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "Its a draw!"
    end

    winner = detect_winner(board)
    update_score(winner, score)
    prompt "The score is now #{score}"
    prompt "Press Enter to continue."
    gets.chomp
  
  end
  game_winner(score)
  prompt 'Play again?'
  reset_score(score)
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end 
