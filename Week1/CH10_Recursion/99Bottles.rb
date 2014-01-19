<<DOC
The song 99 bottles of Beer on the wall
Lyrics from http://www.99-bottles-of-beer.net/lyrics.html
DOC

@numBottles = 0

def SingSong numbottle
  
  if numbottle > 0
    puts "#{numbottle} bottles of beer on the wall, #{numbottle} bottles of beer. " + 
         "Take one down and pass it around, #{numbottle-1} bottles of beer on the wall."
    numbottle -= 1
    SingSong numbottle
  end

end

puts "Would you like me to sing the Bottles on the Wall song y/n?"
if gets.chomp.downcase == 'y'
  puts "How many bottles should we begin with?"
  @numBottles = gets.chomp.to_i
  #puts @numBottles
  puts SingSong @numBottles
end #end if

# End of the Song
puts "No more bottles of beer on the wall, no more bottles of beer. 
Go to the store and buy some more, #{@numBottles} bottles of beer on the wall."