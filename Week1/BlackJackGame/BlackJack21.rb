# BlackJack21.rb  

puts "\nHello! Welcome to BlackJack 21"
puts "\nPlease enter your name"
@UserName = gets.chomp.capitalize

# get the value of the card
def getValue(card_number)
  # get card rank
  rank = case card_number % 13
      when 0, 11, 12 then 10
      when 1 then 11
      else card_number % 13    
  end
        
  return rank
        
end # ends getValue

# for printing value of card    
def printCard(card_number)
  
  # get card rank
  rank = case card_number % 13
      when 0 then  :King
      when 1 then  :Ace
      when 11 then :Jack
      when 12 then :Queen
      else card_number % 13    
  end
  
  # get suit
  suit = case (card_number) % 4
    when 0 then :Heart
    when 1 then :Diamond
    when 2 then :Spade
    else :Club
  end

  return "#{rank} of #{suit}"
          
end
        
# for printing the entire deck    
def printDeck(deck)
 puts "Here the list of cards currently in the deck"
 index = 0
 deck.each do |card|
   puts printCard(card)
  end
end        

def main 
       
  puts "\n    Wait a second while the dealer shuffles the deck!"
  
  # create a random deck of 52 cards
  @deck = (1..52).to_a.shuffle 
      
  # print the deck of cards (numbers only)
  # puts deck.inspect
  
  # print Deck of cards (rank & suit)
  # printDeck(@deck)
 
  #players initial hand  
  @playerHand = [@deck.pop,@deck.pop]
  # dealers initial hand
  @dealersHand = [@deck.pop,@deck.pop]

  puts "\n#{@UserName} you have the " + printCard(@playerHand[0]) + " and the " + printCard(@playerHand[1]) + " for a score of " + scoreHand(@playerHand).to_s
  
  @round_over = false
  @game_over = false
  
  while(!@game_over)
    
    while(!@round_over)
      
      puts "\nWould you like to [H]it, [S]tay or [Q]uit?"
      answer = gets.chomp.downcase.strip
      
      case 
        when answer == 'q'
        @game_over = true
        break
        when answer == 's'
          playerStand       
        when answer == 'h'
          playerHit
      end # end case
        
    end # end inner loop
    
    if (@round_over)
      puts "\nNew Game"
      @round_over = false
      @deck.clear
      @playerHand.clear
      @dealersHand.clear
      
      # create a random deck of 52 cards
      @deck = (1..52).to_a.shuffle
      #players initial hand  
      @playerHand = [@deck.pop,@deck.pop]
      # dealers initial hand
      @dealersHand = [@deck.pop,@deck.pop]
      
      puts "\n#{@UserName} you have the " + printCard(@playerHand[0]) + " and the " + printCard(@playerHand[1]) + " for a score of " + scoreHand(@playerHand).to_s

    end
    
  end # end outer loop
        
end #end of main  

def playerStand
  
  puts "You choose to stand. Your score is " + scoreHand(@playerHand).to_s
  
  puts "\nThe Dealers initial cards are the " + printCard(@dealersHand[0]) + " and the " + printCard(@dealersHand[1]) + " for a score of " + scoreHand(@dealersHand).to_s
  puts "The Dealer chooses to stand" if scoreHand(@dealersHand) > 16
  
  while scoreHand(@dealersHand) < 17
    # Draw a card from the deck and add it to the dealers hand
    @dealersHand << @deck.pop
    puts "The Dealer drew the #{printCard(@dealersHand[@dealersHand.length - 1])}"
    puts "The Dealears score is now #{scoreHand(@dealersHand).to_s}"
    puts "Dealer BUST!" if scoreHand(@dealersHand) > 21
  end #ends while loop
  
  if scoreHand(@dealersHand) > scoreHand(@playerHand) && scoreHand(@dealersHand) < 22 
    puts "You Lose!"
    @round_over = true
  end
  if scoreHand(@dealersHand) < scoreHand(@playerHand) || scoreHand(@dealersHand) > 21
      puts "You Win!"
      @round_over = true
  end
  if scoreHand(@dealersHand) == scoreHand(@playerHand) && scoreHand(@dealersHand) < 22 
      puts "Game ends in a Draw"
      @round_over = true
  end
  
  #reset(@deck)
        
end # ends playerStand

def playerHit
  @playerHand << @deck.pop
  puts "You drew the " + printCard(@playerHand[@playerHand.length-1])
  puts "Your score is now " + scoreHand(@playerHand).to_s
  if scoreHand(@playerHand)> 21
    puts "BUST! You lose." 
    @round_over = true
  end
end #playerHit

#return true if Ace or false if it's another card
def isAce(card_number)
    return true if (card_number % 13) == 1
end # end isAce
      
def scoreHand(hand)
  sum = 0
  aceCount = 0
  
  hand.each do |card|
    aceCount += 1 if isAce(card)
    #puts "Number of aces = #{aceCount}"
    sum += getValue(card)
    
    while sum > 21 do
      if aceCount > 0 then
        sum = sum - 10
        aceCount -= 1
      end # end if
      break if aceCount == 0
    end # end while
    
  end # end each
  
  return sum
      
end # ends scoreHand



main
