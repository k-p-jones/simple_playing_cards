module SimplePlayingCards
  class Deck
    attr_accessor :cards, :options
    def initialize(options = {})
      @cards = []
      @options = options
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
          cards << Card.new(rank, suit, options)
        end
      end
    end
  end
end
