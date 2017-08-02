require 'simple_playing_cards'

RSpec.describe SimplePlayingCards::Card do 
  
  context 'with valid inputs' do
    let(:card) { described_class.new('A', 'Spades') }
    
    it 'has a rank' do 
      expect(card.rank).to eql('A')
    end

    it 'has a suit' do 
      expect(card.suit).to eql('Spades')
    end
  end

  context 'with invalid rank' do 
    it 'raises an ArgumentError' do
      expect { SimplePlayingCards::Card.new('15', 'Spades') }.to raise_error(ArgumentError)
    end
  end

  context 'with invalid suit' do 
    it 'raises an ArgumentError' do 
      expect { SimplePlayingCards::Card.new('A', 'Oranges') }.to raise_error(ArgumentError)
    end
  end

  context 'when input isnt a string' do 
    it 'raises an ArgumentError' do 
      expect { SimplePlayingCards::Card.new(15, 36) }.to raise_error(ArgumentError)
    end
  end

  describe '#name' do 
    let(:card) { described_class.new('10', 'Diamonds') }

    it 'returns the name of the card' do 
      expect(card.name).to eql("10 of Diamonds")
    end
  end
end