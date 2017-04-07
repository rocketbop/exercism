# Calculate the score for a game of bowling
class Game
  attr_reader :score
  def initialize
    @score = 0
    @recent_rolls = []
  end


  def roll(pin)
    @score += pin
    @recent_rolls.push(pin)
    if @recent_rolls.size == 3
      add_outstanding
      @recent_rolls.shift
    end
    @score
  end

  private

  def add_outstanding
    calculate_strike if had_strike?
    calculate_spare if had_spare?
  end

  def had_strike?
    @recent_rolls[0] == 10
  end

  def had_spare?
    (last_roll + second_last_roll) == 10
  end

  def calculate_strike
    @score += (second_last_roll + last_roll)
  end

  def calculate_spare
    @score += current_roll
  end

  def current_roll
    @recent_rolls[2]
  end

  def last_roll
    @recent_rolls[1]
  end

  def second_last_roll
    @recent_rolls[0]
  end
end
