class Frame
  attr_accessor :throws

  def initialize(bonus_frame = false)
    @throws = []
    @bonus_frame = bonus_frame
  end

  def update_throw(pin)
    @throws.push(pin)
    raise Game::BowlingError.new("BowlingError") if invalid?
  end

  def score
    @throws.sum
  end

  def complete?
    unless @bonus_frame
      @throws.size == 2 || strike?
    else
      false
    end
  end

  def strike?
    @throws.first == 10
  end

  def spare?
    @throws.size == 2 && score == 10
  end

  private

  def invalid?
    if !@bonus_frame
      @throws.sum > 10
    elsif @throws[0] < 10
      @throws[0] + @throws[1].to_i > 10
    end
  end
end
