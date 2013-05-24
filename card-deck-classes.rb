#Code written by Matt Barackman, T.J. Singh, Lloyd Taylor and William Bendix

class Card
  attr_reader :definition, :term, :incorrect_guess_count, :correct_guess_count

  def initialize(arg)
    @definition = arg[:definition]
    @term = arg[:term]
    @incorrect_guess_count = 0
    @correct_guess_count = 0
  end

  def match?(guess)
    if guess.downcase == @term.downcase
      @correct_guess_count += 1
      return true
    else
      @incorrect_guess_count += 1
      return false
    end
  end

  def to_s
    "#{@definition}"
  end

end

class Deck
  
  attr_reader :cards, :discards
  def initialize
    @cards = []
    @discards = []
  end

  # arguments to shuffle! are used by test code to validate method operation
  # not required for normal game play.
  def shuffle!(png = Random.new) 
    @cards.shuffle!(random: png)
  end

  def next
    @cards.pop
  end

  def empty?
    @cards.length == 0
  end

  def insert!(card)
    @cards << card
  end

  def discard!(card)
    @discards << card
  end

end
