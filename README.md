# SimplePlayingCards

A simple gem for generating a deck of playing cards.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_playing_cards'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_playing_cards

## Usage

To create a new deck of cards:

`deck = SimplePlayingCards::Deck.new`

Shuffle the deck:

`deck.shuffle`

Deal some cards:

`hand = deck.deal(2)`

Get the card details:

```ruby
card = hand.first
card.rank #=> "A"
card.suit #=> "Spades"
card.name #=> "A of Spades"
```

Every card has a numeric value and comparisons can be made based on that.

```ruby
card_a = SimplePlayingCards::Card.new('10', 'Hearts')
card_b = SimplePlayingCards::Card.new('8', 'Spades')

card_a < card_b #=> false
card_a > card_b #=> true
card_b == card_a #=> false
```

Aces default to a numerical value of `1`. In order to set aces
to high you can pass an options hash to the `Deck` or `Card`.

```ruby
options = { 'aces_high' => true }
deck = SimplePlayingCards.deck.new(options)
```

## Options Hash

The `Deck` and `Card` objects can be initialized with an options hash.
```ruby
# Available options
{ 'aces_high' => true } # sets the value of all aces to 14
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/k-p-jones/simple_playing_cards.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

