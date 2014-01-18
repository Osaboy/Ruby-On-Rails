# define class Card  
class Card  
  
  # declare accessors to expose card properties
  attr_accessor :rank
  attr_accessor :suit
  attr_accessor :value
  
  def initialize(_rank, _suit)    
     
    @rank = _rank
    @suit = _suit
    
    def face_value
      case @rank % 13
        when 1 then :Ace
        when 11 then :Jack
        when 12 then :Queen
        when 13 then :King
        else (@rank % 13)
      end
    end
    
    def suit
      case @suit % 3
        when 0 then :Heart
        when 1 then :Diamond
        when 2 then :Spade
        else :Club
      end
    end
        
    # for printing value of card    
    def to_s
      "#{face_value} of #{suit}"
    end

  end

end