# Make a rock paper scissors with added spock and lizard game

VALID_CHOICES = %w(rock paper scissors spock lizard)
WINNING_CHOICES = { 'rock' => %w(scissors lizard),
                    'paper' => %w(rock spock),
                    'scissors' => %w(paper lizard),
                    'lizard' => %w(spock paper),
                    'spock' => %w(scissors rock) }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WINNING_CHOICES[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt "You Chose: #{choice}; Computer chose: #{computer_choice}."
  display_results(choice, computer_choice)
  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt "Thank you for playing. Good bye!"
