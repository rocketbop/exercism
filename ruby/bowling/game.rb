# Calculate the score for a game of bowling
class Game
  attr_reader :score
  def initialize
    @score = 0
    @recent_rolls = []
    @frame_count = 1
    @frame_throw_count = 0
  end


  def roll(pin)
    if @frame_count == 12
      return
    end
    if @frame_count == 11
      @score += pin
      @frame_count == 12
      return
    end
    @frame_throw_count += 1
    if pin == 10
      @frame_count += 1
      @frame_throw_count = 0
    elsif @frame_throw_count == 2
      @frame_count += 1
      @frame_throw_count = 0
    end
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
