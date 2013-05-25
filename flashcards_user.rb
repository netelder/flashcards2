#Code written by Matt Barackman, T.J. Singh, Lloyd Taylor and William Bendix

require_relative 'card-deck-classes'
require_relative 'flashcards_parser'
require_relative 'flashcard_ui'
require 'debugger'

class Game

  NUMBER_OF_GUESSES = 3

  include UI

  def initialize(deck)
    @deck = deck
  end

  def run
    # debugger
    display_welcome
    puts
    until @deck.empty?
      card = get_card
      display_definition(card)      
      loop_through_guesses(card)
    end
  end

  def get_card
    @deck.next
  end

  def loop_through_guesses(card) 

    3.times do |n|
      guess = STDIN.gets.chomp
      if correct?(card, guess)
        display_correct
        solid_understanding?(card) ? @deck.discard!(card) : @deck.requeue!(card)
        return
      elsif n == 2
        @deck.requeue!(card) 
        display_incorrect(card.term)
      else
        display_incorrect
      end
    end
  end

  # def get_guess
  #   print 'Guess: '
  #   gets.chomp
  # end

  def solid_understanding?(card)
    card.correct_guess_count > card.incorrect_guess_count
  end

  def correct?(card, guess)
    card.match?(guess)
  end

end



deck = Deck.new

ARGV.each do |filename|
  parser = Parser.new(filename: filename, contents_class: Card, 
                      container: deck)
  parser.populate_container!
end

deck.shuffle!
game = Game.new(deck)
game.run
p deck.empty?
