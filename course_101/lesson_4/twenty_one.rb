require 'pry'

SUITS = %w(H S D C).freeze
CARDS = %w(A K Q J 2 3 4 5 6 7 8 9).freeze

def prompt(msg)
  puts msg
end

def deal_card!(deck)
  dealt_card = deck.sample.dup
  deck.delete_if { |card| dealt_card == card }
  dealt_card
end

def nice_output(card)
  change_card_name(card) if card[0].to_i.zero?
  case card[1]
  when 'D'
    prompt "#{card[0]} of Diamonds"
  when 'C'
    prompt "#{card[0]} of Clubs"
  when 'H'
    prompt "#{card[0]} of Hearts"
  else
    prompt "#{card[0]} of Spades"
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
  SUITS.each { |suit|
    CARDS.each { |card| deck << [card, suit] }
  }
end

def total(cards)
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i.zero?
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

def busted?(cards)
  true if total(cards) > 21
end

def find_results(player_cards, dealer_cards)
  player_score = total(player_cards)
  dealer_score = total(dealer_cards)

  if player_score > 21
    :player_busted
  elsif dealer_score > 21
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

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.chars.first
end

continue_playing = 'y'

while continue_playing == 'y'
  prompt "Welcome to Twenty-One!"

  # initialize variables
  deck = []
  player_cards = []
  dealer_cards = []
  answer = nil

  build_deck(deck)

  # deal initial cards
  2.times do
    dealer_cards << deal_card!(deck)
    player_cards << deal_card!(deck)
  end

  prompt "One of the dealer's cards is:"
  nice_output(dealer_cards.first)

  prompt "You have the following cards:"
  player_cards.each { |card| nice_output(card) }
  prompt "The total value of the cards is: #{total(player_cards)}"

  # player's turn
  until busted?(player_cards) || busted?(dealer_cards) || answer == 's'
    prompt "(H)it or (S)tay?"
    answer = gets.chomp.downcase.chars.first
    if answer.include?('h')
      player_cards << deal_card!(deck) 
      prompt "You chose to hit!"
      prompt "You have the following cards now:"
      player_cards.each { |card| nice_output(card) }
      prompt "The total value of the cards is: #{total(player_cards)}"
    else
      next
    end
  end

  prompt "The Dealer had the following cards:"
  dealer_cards.each { |card| nice_output(card) }
  prompt "The amount that they add up to is: #{total(dealer_cards)}"

  prompt "\n"

  prompt "The Player had the following cards:"
  player_cards.each { |card| nice_output(card) }
  prompt "The amount that they add up to is: #{total(player_cards)}"

  display_results(player_cards, dealer_cards)
  continue_playing = play_again?
end
