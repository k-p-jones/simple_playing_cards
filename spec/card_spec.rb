require 'simple_playing_cards'

RSpec.describe SimplePlayingCards::Card do 
  let(:options) { {'aces_high' => true} }

  context 'with valid inputs' do
    let(:card) { described_class.new('3', 'Spades', options) }
    
    it 'has a rank' do 
      expect(card.rank).to eql('3')
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
    let(:card) { described_class.new('10', 'Diamonds', options) }

    it 'returns the name of the card' do 
      expect(card.name).to eql("10 of Diamonds")
    end
  end

  describe '#value' do 
    context 'non picture cards' do 
      it 'returns an integer value equal to its rank' do 
        card = described_class.new('5', 'Diamonds', options)
        expect(card.value).to eql(5)
      end
    end

    context 'picture cards' do 
      it 'returns 11 for a jack' do 
        card = described_class.new('J', 'Diamonds', options)
        expect(card.value).to eql(11)        
      end

      it 'returns 12 for a queen' do 
        card = described_class.new('Q', 'Diamonds', options)
        expect(card.value).to eql(12)        
      end

      it 'returns 11 for a jack' do 
        card = described_class.new('K', 'Diamonds', options)
        expect(card.value).to eql(13)        
      end
    end

    context 'aces high' do
      it 'returns 14 for an ace' do 
        card = described_class.new('A', 'Diamonds', options)
        expect(card.value).to eql(14) 
      end
    end 

    context 'aces low' do 
      it 'returns 1 for an ace' do
        low_options = {'aces_high' => false}
        card = described_class.new('A', 'Diamonds', low_options)
        expect(card.value).to eql(1) 
      end
    end
  end
end
