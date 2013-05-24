module UI

  def display_welcome
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
  end

  def get_guess
    print 'Guess: '
    gets.chomp
  end

  def display_correct
    puts 'Correct!'
  end

  def display_incorrect(correct_term = nil)
    print "Incorrect"
    print "The correct answer is #{correct_term}" if correct_term
    print "\n"
  end

  def display_definition(card)
    puts card.definition
  end

end
