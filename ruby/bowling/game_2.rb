require 'pry'

#  Game class rolls and scores 
class Game
  def initialize
    @frames = [Frame.new]
  end

  def roll(pin)
    raise BowlingError.new("BowlingError") if pin < 0
    current_frame.update_throw(pin)
    return unless current_frame.strike? || current_frame.complete?
    @frames.push(Frame.new)
  end

  def score
    total = 0
    @frames.each_with_index do |frame, index|
      break if index > 9
      total += frame.score
      if frame.complete? && frame.spare?
        total += @frames[index + 1].throws.first
      elsif frame.strike?
        total += score_strike(index)
      end
    end
    total
  end

  private

  def current_frame
    @frames.last
  end

  def score_strike(strike_index)
    total = 0
    total += @frames[strike_index + 1].throws[0]
    total += if @frames[strike_index + 1].throws.size == 2
               @frames[strike_index + 1].throws[1]
             else
               @frames[strike_index + 2].throws[0]
             end
    total
  end
end

class BowlingError < StandardError
end

class Frame
  attr_accessor :throws

  def initialize
    @throws = []
  end

  def update_throw(pin)
    @throws.push(pin)
  end

  def score
    @throws.sum
  end

  def complete?
    @throws.size == 2 || strike?
  end

  def strike?
    @throws.first == 10
  end

  def spare?
    @throws.size == 2 && score == 10
  end
end
