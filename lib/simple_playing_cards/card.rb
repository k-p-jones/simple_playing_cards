module SimplePlayingCards
  class Card
    RANKS = %w[A 2 3 4 5 6 7 8 9 10 J K Q]
    SUITS = %w[Spades Hearts Diamonds Clubs]
    
    attr_reader :rank, :suit
    def initialize(rank, suit)
      validate_inputs(rank, suit)
      @rank = rank
      @suit = suit
    end

    def name
      "#{rank} of #{suit}"
    end

    private

    def validate_inputs(rank, suit)
      errors = []
      errors << "Invalid argument type. Rank and Suit most both be strings!" unless rank.is_a?(String) && suit.is_a?(String)
      errors << "#{rank} is not a valid rank for a playing card!" unless RANKS.include?(rank)
      errors << "#{suit} is not a valid suit for a playing card!" unless SUITS.include?(suit)
      
      raise ArgumentError.new(errors.join(" ")) unless errors.empty?
    end
  end
end