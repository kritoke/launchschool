
SUITS = %w(H S D C).freeze
CARDS = %w(A K Q J 2 3 4 5 6 7 8 9).freeze

def prompt(msg)
  puts msg
end

def deal_card!(deck)
  dealt_card = deck.sample
  deck.delete_if { |card| dealt_card == card }
  dealt_card
end

def make_move!
  
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

deck = []
player_cards = []
dealer_cards = []

build_deck(deck)

answer = nil

dealer_cards << deal_card!(deck)
player_cards << deal_card!(deck)


until busted?(player_cards) || busted?(dealer_cards) || answer == 'stay'
  dealer_cards << deal_card!(deck)
  player_cards << deal_card!(deck)
  p total(player_cards)
  prompt "Hit or Stay?"
  answer = gets.chomp.downcase
end

prompt "Player lost."  if busted?(player_cards)
prompt "Dealer lost."  if busted?(dealer_cards)


prompt "The Dealer has the following cards:"
dealer_cards.each { |card| nice_output(card) }
prompt "The amount that they add up to is: #{total(dealer_cards)}"

prompt "\n"

prompt "The Player has the following cards:"
player_cards.each { |card| nice_output(card) }
prompt "The amount that they add up to is: #{total(player_cards)}"
