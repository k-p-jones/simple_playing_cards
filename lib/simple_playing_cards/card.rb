module SimplePlayingCards
  class Card
    include Comparable
    RANKS = %w[Ace 2 3 4 5 6 7 8 9 10 Jack King Queen]
    SUITS = %w[Spades Hearts Diamonds Clubs]
    
    attr_reader :rank, :suit
    attr_accessor :value, :options
    
    def initialize(rank, suit, options = {})
      validate_inputs(rank, suit)
      @options = options
      @rank = rank
      @suit = suit
      @value = assign_value
    end

    def name
      "#{rank} of #{suit}"
    end

    def <=> (card)
      if self.value < card.value
        -1
      elsif self.value > card.value
        1
      else
        0
      end  
    end

    private

    def assign_value
      if rank.to_i > 0
        rank.to_i
      else
        case rank
        when 'Jack'
          11
        when 'Queen'
          12
        when 'King'
          13  
        when 'Ace'
          options['aces_high'] ? 14 : 1
        end
      end  
    end

    def validate_inputs(rank, suit)
      errors = []
      errors << "Invalid argument type. Rank and Suit most both be strings!" unless rank.is_a?(String) && suit.is_a?(String)
      errors << "#{rank} is not a valid rank for a playing card!" unless RANKS.include?(rank)
      errors << "#{suit} is not a valid suit for a playing card!" unless SUITS.include?(suit)
      
      raise ArgumentError.new(errors.join(" ")) unless errors.empty?
    end
  end
end
