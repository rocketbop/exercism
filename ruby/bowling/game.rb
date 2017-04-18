require_relative "frame"
require_relative "bowling_error"

#  Game class rolls and scores
class Game
  def initialize
    @frames = [Frame.new]
  end

  def roll(pin)
    return unless pin.is_a?(Integer)
    @game_started ||= true
    current_frame.update_throw(pin)
    raise BowlingError.new("BowlingError") if invalid?(pin)
    return unless current_frame.complete? && !game_over?
    if @frames.size > 9
      @frames.push(Frame.new(true))
    else
      @frames.push(Frame.new)
    end
  end

  def score
    if !defined?(@game_started) || @frames.length < 10
      raise BowlingError.new("BowlingError")
    elsif @frames.length > 10 && @frames[9].score < 10
      # binding.pry
      raise BowlingError.new("BowlingError")
    end
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

  def invalid?(pin)
    pin < 0 || pin > 10
  end

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

  def game_over?
    @frames.length >= 10 && @frames[9].score < 10 && current_frame.complete?
  end
end
