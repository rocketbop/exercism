# Calculate the score for a game of bowling
require 'pry'
class Game
  attr_accessor :score
  def initialize
    @score = 0
    @doubles = 0
    @frame = 1
    @frames = []
    @current_frame = []
  end

  def roll(pin)
    update_frame(pin)
    update_score(pin)
    update_doubles(pin)
    end_frame if is_strike?(pin) || is_spare?(pin) || is_open?(pin)
  end

  private

  def update_frame(pin)
    @current_frame.push(pin)
  end

  def update_score(pin)
    @score += pin
    return unless @doubles > 0
    @score += pin
    @doubles -= 1
  end

  def update_doubles(pin)
    @doubles += 2 if is_strike?(pin)
    @doubles += 1 if is_spare?(pin)
  end

  def end_frame
    @frames.push(@current_frame)
    @current_frame = []
    return unless @frame < 11
    @frame += 1
  end

  def is_strike?(pin)
    pin == 10
  end

  def is_spare?(pin)
    (@current_frame.size == 2) && (pin + @current_frame[0] == 10)
  end

  def is_open?(pin)
    (@current_frame.size == 2) && (pin + @current_frame[0] < 10)
  end
end
