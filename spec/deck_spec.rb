require 'simple_playing_cards'

def test_deck
  suits = SimplePlayingCards::Card::SUITS 
  ranks = SimplePlayingCards::Card::RANKS
  test_deck =  []
  suits.each do |suit|
    ranks.each do |rank|
      test_deck << [rank, suit]
    end
  end
  test_deck
end

RSpec.describe SimplePlayingCards::Deck do 
  let(:example_deck) { test_deck }

  it 'should have 52 cards' do 
    expect(described_class.new.cards.count).to eql(52)
  end

  it 'should contain the correct cards' do 
    expect(described_class.new.cards.map { |card| [card.rank, card.suit] })
      .to match_array(example_deck)
  end

  describe '#deal' do 
    it 'should return the amount of cards asked for' do 
      deck = described_class.new
      hand = deck.deal(3)
      expect(hand.count).to be(3)
    end

    it 'should leave the correct amount in the deck' do 
      deck = described_class.new
      hand = deck.deal(10)
      expect(deck.cards.count).to be (42)
    end
  end

  describe '#shuffle' do 
    it 'should shuffle the cards' do 
      deck = described_class.new
      deck.shuffle
      
      expect(deck.cards.map { |card| [card.rank, card.suit] })
      .not_to eql(example_deck)
    end
  end
end