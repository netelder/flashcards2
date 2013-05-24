#Code written by Matt Barackman, T.J. Singh, Lloyd Taylor and William Bendix


require_relative 'card-deck-classes'
require_relative 'flashcards_parser'
require_relative 'flashcard_ui'


class Game

  NUMBER_OF_GUESSES = 3

  def initialize(deck)
    @deck = deck
  end

  def self.run

    display_welcome
    until deck.empty?
      card = get_card
      display_definition(card)      
      loop_through_guesses
    end
  
  end

  def get_card
    deck.next
  end

  def loop_through_guesses
    NUMBER_OF_GUESSES.times do |x|
      guess = get_guess

      if card.match?(guess)
        display_correct
        break
      elsif x == NUMBER_OF_GUESSES - 1
        display_incorrect(card.term)
      else
        display_incorrect
      end

    end
  end

  def process_guess(card, guess)

  end




end









deck = Deck.new

ARGV.each do |filename|
  parser = Parser.new(filename: filename, contents_class: Card, 
                      container: deck)
  parser.populate_container!
end
deck.shuffle!
Game.run(deck)

