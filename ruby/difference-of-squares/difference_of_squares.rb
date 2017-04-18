require 'pry'

class Squares
  def initialize(number)
    @number = number
  end

  def square_of_sum
    sums * sums
  end

  def sum_of_squares
    squares.inject(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def sums
    return 0 if @number.zero?
    (1..@number).to_a.inject(:+)
  end

  def squares
    return [0] if @number.zero?
    (1..@number).to_a.map { |item| item * item }
  end
end

module BookKeeping
  VERSION = 3
end