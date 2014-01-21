# Interaction command line blackjack game

def calculate_total(cards) # [['Suit','Rank'],['Suit','Rank'],...]

  arr = cards.map{ |e| e[1] }
  total = 0

  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  # correct for Aces
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  return total
end

# Start Game

puts "Welcome to BlackJack!"

suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '3', '4', '5', '6', '7', '8', '9', '10','J','Q','K','A']

deck = suits.product(cards) # same thing as looping through using double each loops
  <<-DOC
  deck = []
  suits.each do |suit|
    cards.each do |card|
      deck <<[suit, card]
    end
  end
  DOC
  

deck.shuffle!

# Deal Cards

mycards = []
dealerscards = []

mycards << deck.pop
dealerscards << deck.pop
mycards << deck.pop
dealerscards << deck.pop

# Show Cards

# for debugging
#puts "mycards are: " + mycards.to_s
#puts "dealerscards are: " + dealerscards.to_s

dealerstotal = calculate_total(dealerscards)
mytotal = calculate_total(mycards)

# Show cards

puts "Dealer has: #{dealerscards[0]} and #{dealerscards[1]} for a total of: #{dealerstotal}}"
puts "You have: #{mycards[0]} and #{mycards[1]} for a total of: #{mytotal}"

# Player turn
if mytotal == 21
  puts "Congratulations, you hit blackjack"
  exit
end


while mytotal < 21
  puts "\nWhat would you like to do? 1) [H]it 2) [S]tay"
  hit_or_stay = gets.chomp.downcase.strip
  
  if !['h','s'].include?(hit_or_stay)
    puts "Error: you must enter H or S"
    next # stop current execution of loop and go to the next iteration
  end

  if hit_or_stay == "s"
    puts "You chose to stay."
    break # breaking out ot the loop, continue from line with #end while
  end
  
  mycards << deck.pop
  puts "Dealing card to player: #{mycards[mycards.length-1]}"
  mytotal = calculate_total(mycards)
  puts "Your total is now: #{mytotal}"

  if mytotal == 21
    puts "Congratulations, you hit blackjack"
    exit   
  elsif mytotal > 21
    puts "Sorry, it looks like you busted!"
    exit
  end
end #end while

if dealerstotal == 21
  puts "Sorry, dealer hith BlackJack. You lose."
  exit
end

while dealerstotal < 17
  #hit
  dealerscards << deck.pop
  puts "Dealing new card for dealer: #{dealerscards[dealerscards.length-1]}"
  dealerstotal = calculate_total(dealerscards)
  puts "Dealers total is now: #{dealerstotal}"

  if dealerstotal == 21
      puts "Sorry, dealer hit BlackJack"
      exit   
    elsif dealerstotal > 21
      puts "Congratulations, dealer busted! You Win!"
      exit
    end
end

# Compare hands
puts "Dealer's cards: "
dealerscards.each do |card|
  puts "=>#{card}"
end

puts "Your cards: "
mycards.each do |card|
  puts "=>#{card}"
end

if dealerstotal > mytotal
  puts "Sorry, dealer won."
elsif dealerstotal < mytotal
  puts "Congratulations, you win!"
else
  puts "Draw"
end


