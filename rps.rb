# Rock paper scissors, need to add Lizard Spock

def prompt(message)
  Kernel.puts("=> #{message}")
end

def choice_to_letter(letter)
  case
  when letter.downcase.start_with?('r')
    then 'rock'
  when letter.downcase.start_with?('p')
    then 'paper'
  when letter.downcase.start_with?('s')
    then 'scissors'
  end
end

def update_score(score, winner)
  score[winner] += 1
end

def process_results(choice, computer_choice, score)
  if (choice == 'rock' && computer_choice == 'scissors') ||
     (choice == 'paper' && computer_choice == 'rock') ||
     (choice == 'scissors' && computer_choice == 'paper')
    display_results("human")
    score[:human] += 1
  elsif (choice == 'rock' && computer_choice == 'paper') ||
        (choice == 'paper' && computer_choice == 'scissors') ||
        (choice == 'scissors' && computer_choice == 'rock')
    display_results("computer")
    score[:computer] += 1
  else display_results("draw")
  end
end

def display_results(winner)
  if winner == "human"
    prompt("You win!")
  elsif winner == "computer"
    prompt("You lose")
  else
    prompt("Its a draw!")
  end
end

def someone_wins(score)
  if score[:human] == 5
    puts "======> YOU WIN"
    return true
  elsif score[:computer] == 5
    puts "======> YOU LOSE"
    return true
  else return false
  end
end

VALID_CHOICES = %w(rock paper scissors)
score = { computer: 0, human: 0 }
choice = ''

prompt("======>")
prompt("Its Rock, Paper, Scissors - first to 5.  CAN I HAVE A GO")
prompt("======>")

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets.chomp()
    choice = choice_to_letter(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}, computer chose #{computer_choice}")

  process_results(choice, computer_choice, score)
  prompt("The score is #{score}")

  if score[:human] == 5 || score[:computer] == 5
    break
  end
end

if score[:human] > score[:computer]
  puts "YOU WIN!"
else puts "YOU LOSE!"
end

puts "=======>"
puts "Thank you for playing!"
