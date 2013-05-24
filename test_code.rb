require_relative 'card-deck-classes'
require_relative 'flashcards_parser'

# Test Card class

card1 = Card.new(definition: "Command to instantiate a new object of class Array", term: "Array.new")
card2 = Card.new(definition: "William\'s favorite flavor icecream", term: "Phish food")
p card1.inspect == "Command to instantiate a new object of class Array"
p card1.definition == "Command to instantiate a new object of class Array"
# p card1.term => should throw an error
p card1.match?("Array.new") == true
p card1.match?("array.New") == true
p card1.match?("foobar") == false
p card1.incorrect_guess_count == 1
p card1.correct_guess_count == 2

# Test Deck class

deck1 = Deck.new
p deck1.cards == []
p deck1.empty? == true
p deck1.insert!(card1) == [card1]
p deck1.cards  == [card1]
p deck1.empty? == false
p deck1.insert!(card2) == [card1, card2]
p deck1.cards == [card1, card2]
p deck1.next  == card2
#add shuffle! tests
deck1.insert!(card2)
prng = Random.new(1234)  # seed RNG for testing
p deck1.shuffle!(prng) == [card2, card1]

deck1.report

p deck1.discards == []
card = deck1.next
p deck1.discard!(card) == [card]
p deck1.cards == [card2]

