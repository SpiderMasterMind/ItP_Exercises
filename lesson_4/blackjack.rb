DECK = [['2', 'H'], ['3', 'H'], ['4', 'H'], ['5', 'H'], ['6', 'H'], ['7', 'H'], ['8', 'H'],
        ['9', 'H'], ['10', 'H'], ['J', 'H'], ['Q', 'H'], ['K', 'H'], ['A', 'H'],
        ['2', 'C'], ['3', 'C'], ['4', 'C'], ['5', 'C'], ['6', 'C'], ['7', 'C'], ['8', 'C'],
        ['9', 'C'], ['10', 'C'], ['J', 'C'], ['Q', 'C'], ['K', 'C'], ['A', 'C'],
        ['2', 'S'], ['3', 'S'], ['4', 'S'], ['5', 'S'], ['6', 'S'], ['7', 'S'], ['8', 'S'],
        ['9', 'S'], ['10', 'S'], ['J', 'S'], ['Q', 'S'], ['K', 'S'], ['A', 'S'],
        ['2', 'D'], ['3', 'D'], ['4', 'D'], ['5', 'D'], ['6', 'D'], ['7', 'D'], ['8', 'D'],
        ['9', 'D'], ['10', 'D'], ['J', 'D'], ['Q', 'D'], ['K', 'D'], ['A', 'D']]
BUSTED_VALUE = 21
DEALER_LIMIT = 17
player_hand = []
dealer_hand = []
player_value = 0
player_final_value = 0
dealer_value = 0
answer = ''
score = { :player => 0, :dealer => 0 }

def prompt(msg)
  puts "=> #{msg}"
end

def initialise_board(player_hand, dealer_hand)
  player_hand.clear
  dealer_hand.clear
  system 'clear'
  2.times do
    player_hand << DECK.shuffle.shift
    dealer_hand << DECK.shuffle.shift
  end
end

def find_player_value(player_hand)
  values = player_hand.map { |value| value[0] }
  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def player_draws_card(player_hand)
  player_hand << DECK.shuffle.shift
end

def dealer_draws?(hand_value)
  hand_value < DEALER_LIMIT
end

def dealer_draws_card(dealer_hand)
  dealer_hand << DECK.shuffle.shift
end

def player_bust?(hand_value)
  hand_value > BUSTED_VALUE
end

def display_hands(player_hand, dealer_hand, hand_value)
  prompt "You hold #{convert_hand(player_hand)} with a value of #{hand_value}"
  prompt "Dealer holds #{dealer_hand[0][0]} of #{dealer_hand[0][1]} and a hidden card"
end

def display_final_hands(player_hand, player_final_value, dealer_hand, hand_value)
  prompt "You hold #{convert_hand(player_hand)} with a value of (#{player_final_value})"
  prompt "Dealer holds #{convert_hand(dealer_hand)} with a value of (#{hand_value})"
end

def convert_hand(player_hand)
  player_hand.each_with_object("") do |card, result|
    result << "#{card[0]} of #{card[1]} "
  end
end

#def calculate_winner(player_final_value, dealer_value, score)
#  if ((BUSTED_VALUE - player_final_value) < (BUSTED_VALUE - dealer_value)) || dealer_value > 21
#    prompt "You Win!"
#    score[:player] += 1
#  elsif player_final_value == dealer_value
#    prompt "Its a draw"
#  else
 #   prompt "You lose!"
 #   score[:dealer] += 1
 # end
#end

def display_winner(player_final_value, dealer_value, score)
  if player_final_value > 21
    prompt "You are bust!"
    score[:dealer] += 1
  elsif dealer_value > 21
    prompt "You Win!"
    score[:player] += 1
  elsif ((BUSTED_VALUE - player_final_value) < (BUSTED_VALUE - dealer_value))
    prompt "You Win!"
    score[:player] += 1
  elsif ((BUSTED_VALUE - player_final_value) > (BUSTED_VALUE - dealer_value))
    prompt "You lose!"
    score[:dealer] += 1
  else prompt "Its a draw!"
  end
end

#def increment_score(score, player_value)
#  if player_value > 21
#    score[:dealer] += 1
#  end
#end

def display_score(score)
  prompt "Player: #{score[:player]}"
  prompt "Dealer: #{score[:dealer]}"
end

def someone_wins?(score)
  score[:player] == 3 || score[:dealer] == 3
end

loop do
  loop do
    initialise_board(player_hand, dealer_hand)
    prompt "BLACKJACK:"
    prompt "=========="
    display_score(score)
    prompt "Press any key to deal cards.."
    gets.chomp

    player_value = find_player_value(player_hand)
    display_hands(player_hand, dealer_hand, player_value)
    loop do
      break if player_bust?(player_value)
      prompt "Choose: (S)tick or (T)wist"
      answer = gets.chomp
      if answer == "t"
        player_draws_card(player_hand)
        player_value = find_player_value(player_hand)
        display_hands(player_hand, dealer_hand, player_value)
      else
        break
      end
    end
    if player_bust?(player_value)
       #prompt "You are bust!"
      # score[:dealer] += 1
    end
    loop do
      player_final_value = player_value
      dealer_value = find_player_value(dealer_hand)
      break if player_bust?(player_value)
      if dealer_draws?(dealer_value)
        dealer_draws_card(dealer_hand)
        dealer_value = find_player_value(dealer_hand)
        prompt "Dealer draws and shows #{convert_hand(dealer_hand)} with a value of (#{dealer_value})"
      else
        prompt "Dealer stays showing #{convert_hand(dealer_hand)} with a value of (#{dealer_value})"
        break
      end
    end
    display_final_hands(player_hand, player_final_value, dealer_hand, dealer_value)
    display_winner(player_final_value, dealer_value, score)
    #increment_score(score, player_value)
    gets.chomp
    break if someone_wins?(score)
  end
  if score[:player] > score[:dealer]
    prompt "You win the match!"
  else
    prompt "You lose the match!"
  end
  prompt "Play again?"
  response = gets.chomp
  player_hand = []
  dealer_hand = []
  score = { :player => 0, :dealer => 0 }
  break unless response.downcase.start_with?('y')
end
prompt "Thanks for playing!"
