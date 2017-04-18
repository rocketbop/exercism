require 'pry'

class Squares
  def initialize(number)
    @number = number
    @range = (1..@number).to_a
  end

  def square_of_sum
    sums * sums
  end

  def sum_of_squares
    squares.inject(0, :+)
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  def sums
    @range.inject(0, :+)
  end

  def squares
    @range.map { |item| item * item }
  end
end

module BookKeeping
  VERSION = 3
end
