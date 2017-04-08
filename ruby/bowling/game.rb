require 'pry'

# Calculate the score for a game of bowling
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
    end_frame if strike?(pin) || spare?(pin) || open?(pin)
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
    return if @frame == 10
    @doubles += 2 if strike?(pin)
    @doubles += 1 if spare?(pin)
  end

  def end_frame
    @frames.push(@current_frame)
    @current_frame = []
    return unless @frame < 11
    @frame += 1
  end

  def strike?(pin)
    pin == 10
  end

  def spare?(pin)
    last_frame_throw && (pin + @current_frame[0] == 10)
  end

  def open?(pin)
    last_frame_throw && (pin + @current_frame[0] < 10)
  end

  def last_frame_throw
    @current_frame.size == 2
  end
end
