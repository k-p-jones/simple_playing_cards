module SimplePlayingCards
  class Deck
    attr_accessor :cards
    def initialize
      @cards = []
      build_deck
    end

    def deal(amount)
      cards.shift(amount)
    end

    def shuffle
      cards.shuffle!
    end

    private
    
    def build_deck
      Card::SUITS.each do |suit|
        Card::RANKS.each do |rank|
          cards << Card.new(rank, suit)
        end
      end
    end
  end
end