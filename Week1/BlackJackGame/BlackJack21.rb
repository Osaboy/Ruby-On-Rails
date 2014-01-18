# BlackJack21.rb  

puts "Hello! Welcome to BlackJack 21"

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
       
  puts "\nwait a second while the dealer shuffles the deck!"
  # create a random deck of 52 cards
  @deck = (1..52).to_a.shuffle 
      
  # print the deck of cards (numbers only)
  # puts deck.inspect
  
  # print Deck of cards (rank & suit)
  printDeck(@deck)
 
  #players initial hand  
  @playerHand = [@deck.pop,@deck.pop]
  # dealers initial hand
  @dealersHand = [@deck.pop,@deck.pop]

  game_over = false
  
  while(!game_over)
    
    puts "\nWould you like to [H]it, [S]tay or [Q]uit?"
    answer = gets.chomp.downcase.strip
    
    case 
      when answer == 'q'
      break
      when answer == 's'
        puts "s"
        playerStand
        #scoreHand
      when answer == 'h'
        puts "h"
        playerHit 
    end # end case
        
  end # end loop
        
end #end of main  

def playerStand
  
  @dealersHand << @deck.pop
  puts "You choose to stand. Your score is " + scoreHand(@playerHand).to_s
  puts "The Dealers initial cards are the " + printCard(@playerHand[0]) + " and the " + printCard(@playerHand[1]) + " for a score of " + scoreHand(@dealerHand).to_s
  puts "The Dealer chooses to stand" if scoreHand(@dealerHand) > 16
   
end # ends playerStand

def playerHit
  @playerHand << @deck.pop
  puts "You drew the " + printCard(@playerHand[@playerHand.length-1])
  puts "Your score is now " + scoreHand(@playerHand).to_s
  puts "BUST! You lose." if scoreHand(@playerHand)> 21
end #playerHit
      
def scoreHand(hand)
  return 0
end # ends scoreHand

#return true if Ace or false if it's another card
def isAce(card_number)
  if card_number % 13 == 1
    return true
  else
    return false
  
end # end isAce

main
