SUITS = %w(H S D C).freeze
CARDS = %w(A K Q J 2 3 4 5 6 7 8 9).freeze
WIN_VALUE = 21
DEALER_HIT_VALUE = 17
WIN_SCORE = 5

def prompt(msg)
  puts msg
end

def deal_card!(deck)
  dealt_card = deck.sample.dup
  deck.delete_if { |card| dealt_card == card }
  dealt_card
end

def nice_output(card)
  new_card_name = card.dup
  change_card_name(new_card_name) if new_card_name[0].to_i.zero?
  case card[1]
  when 'D'
    prompt "#{new_card_name[0]} of Diamonds"
  when 'C'
    prompt "#{new_card_name[0]} of Clubs"
  when 'H'
    prompt "#{new_card_name[0]} of Hearts"
  else
    prompt "#{new_card_name[0]} of Spades"
  end
end

def change_card_name(card)
  case card[0]
  when 'A'
    card[0] = 'Ace'
  when 'K'
    card[0] = 'King'
  when 'Q'
    card[0] = 'Queen'
  when 'J'
    card[0] = 'Jack'
  end
end

def build_deck(deck)
  SUITS.each { |suit| CARDS.each { |card| deck << [card, suit] } }
end

def total(cards)
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i.zero?
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > WIN_VALUE
  end

  sum
end

def hit_or_stay
  answer = nil
  until answer == 'h' || answer == 's'
    prompt "(H)it or (S)tay?"
    answer = gets.chomp.downcase.chars.first
    if answer.include?('h')
      prompt "You chose to hit!"
    else
      prompt "You must enter 'h' or 's'."
    end
  end
  answer
end

def player_turn(player_cards, deck)
  answer = nil
  until busted?(player_cards) || answer == 's'
    answer = hit_or_stay
    if answer.include?('h')
      player_cards << deal_card!(deck)
      prompt "You have the following cards now:"
      player_cards.each { |card| nice_output(card) }
      player_total = total(player_cards)
      prompt "The total value of the cards is: #{player_total}"
      prompt "\n"
    else
      next
    end
  end
end

def dealer_turn(dealer_cards, deck)
  dealer_total = total(dealer_cards)
  until busted?(dealer_cards) || dealer_total >= DEALER_HIT_VALUE
    prompt "Dealer hits!"
    dealer_cards << deal_card!(deck)
    prompt "Dealer's cards are now: "
    dealer_cards.each { |card| nice_output(card) }
    dealer_total = total(dealer_cards)
  end
end

def busted?(cards)
  total(cards) > WIN_VALUE
end

def find_results(player_cards, dealer_cards)
  player_score = total(player_cards)
  dealer_score = total(dealer_cards)

  if player_score > WIN_VALUE
    :player_busted
  elsif dealer_score > WIN_VALUE
    :dealer_busted
  elsif player_score > dealer_score
    :player_wins
  elsif player_score < dealer_score
    :dealer_wins
  else
    :tie
  end
end

def display_results(player_cards, dealer_cards)
  result = find_results(player_cards, dealer_cards)
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player_wins
    prompt "You win!"
  when :dealer_wins
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def update_high_score!(score, result)
  case result
  when :player_wins
    score[:player] += 1
  when :dealer_wins
    score[:dealer] += 1
  when :dealer_busted
    score[:player] += 1
  when :player_busted
    score[:dealer] += 1
  end
end

def check_game_winner(score)
  if score[:player] == WIN_SCORE
    :player_wins
  elsif score[:dealer] == WIN_SCORE
    :dealer_wins
  end
end

def display_cards(player_cards, dealer_cards)
  puts "=============="
  prompt "The Dealer had the following cards:"
  dealer_cards.each { |card| nice_output(card) }
  prompt "The amount that they add up to is: #{total(dealer_cards)}"

  prompt "\n"

  prompt "The Player had the following cards:"
  player_cards.each { |card| nice_output(card) }
  prompt "The amount that they add up to is: #{total(player_cards)}"
  puts "=============="
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.chars.first
end

def high_score_reached(score)
  score.value?(WIN_SCORE)
end

def print_beginning(player_cards, dealer_cards)
  prompt "One of the dealer's cards is:"
  nice_output(dealer_cards.first)
  prompt "\n"

  prompt "You have the following cards:"
  player_cards.each { |card| nice_output(card) }
  prompt "The total value of the cards is: #{total(player_cards)}"
  prompt "\n"
end

def print_scores(score)
  prompt "=============="
  prompt "Current Scores:"
  prompt "Player: #{score[:player]}"
  prompt "Dealer: #{score[:dealer]}"
  prompt "First to Reach #{WIN_SCORE}, Wins."
  prompt "=============="
end

continue_playing = 'y'
score = { player: 0, dealer: 0 }

until score.fetch(:player) == WIN_SCORE || score.fetch(:dealer) == WIN_SCORE ||
      continue_playing != 'y'
  prompt "Welcome to the Game of #{WIN_VALUE}!"
  print_scores(score)

  # initialize variables
  deck = []
  player_cards = []
  dealer_cards = []

  build_deck(deck)

  # deal initial cards
  2.times do
    dealer_cards << deal_card!(deck)
    player_cards << deal_card!(deck)
  end

  print_beginning(player_cards, dealer_cards)

  player_turn(player_cards, deck)
  player_total = total(player_cards)

  if !busted?(player_cards)
    prompt "You stayed at #{player_total}."
    dealer_turn(dealer_cards, deck)
    dealer_total = total(dealer_cards)
    prompt "Dealer stays at #{dealer_total}." if !busted?(dealer_cards)
  end

  update_high_score!(score, find_results(player_cards, dealer_cards))
  display_cards(player_cards, dealer_cards)
  display_results(player_cards, dealer_cards)
  print_scores(score)

  if check_game_winner(score) == :player_wins
    prompt "You won #{WIN_SCORE} rounds! Congrats."
    prompt "=============="
  elsif check_game_winner(score) == :dealer_wins
    prompt "The dealer won #{WIN_SCORE} rounds! Better luck next time."
    prompt "=============="
  end

  continue_playing = play_again?
  score = { player: 0, dealer: 0 } if high_score_reached(score) &&
                                      continue_playing == 'y'
end

prompt "Thank you for playing #{WIN_VALUE}! Good bye!"
