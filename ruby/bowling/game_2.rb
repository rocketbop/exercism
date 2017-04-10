require 'pry'
class Game
  def initialize
    @frames = [Frame.new]
  end

  def roll(pin)
    current_frame.save_throw(pin)
    return unless current_frame.strike? || current_frame.throw == 2
    @frames.push(Frame.new)
  end

  def score
    @frames.map(&:score).sum
  end

 private

  def current_frame
    @frames.last
  end
end

class Frame
  def initialize
    @throws = []
  end

  def save_throw(pin)
    @throws.push(pin)
  end

  def score
    @throws.sum
  end

  def throw
    @throws.size + 1
  end

  def strike?
    @throws.first == 10
  end
end
