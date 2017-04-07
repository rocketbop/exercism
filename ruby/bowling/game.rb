# Calculate the score for a game of bowling
class Game
  attr_reader :score

  def initialize
    @score = 0
    @recent_rolls = [0, 0, 0]
    @frame_count = 1
    @frame_throw_count = 0
    @game_over = false
  end

  def roll(pin)
    return if @game_over
    if one_roll_bonus?
      @score += pin
      @game_over = true
      return
    end
    @frame_throw_count += 1
    if end_of_frame?(pin)
      @frame_count += 1
      @frame_throw_count = 0
    end
    @score += pin
    update_rolls(pin)
    add_outstanding
    @score
  end

  private

  def one_roll_bonus?
    @frame_count == 11
  end

  def end_of_frame?(pin)
    pin == 10 || @frame_throw_count == 2
  end

  def update_rolls(pin)
    @recent_rolls.push(pin)
    @recent_rolls.shift
  end

  def add_outstanding
    if had_strike?
      calculate_strike
    end
    if had_spare?
      calculate_spare
    end  
  end

  def had_strike?
    second_last_roll == 10
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
