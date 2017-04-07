# Class that calculates distances between strings
class Hamming
  def self.compute(a, b)
    raise ArgumentError.new("Wrong number of arguments") unless a.length == b.length
    result = 0
    a.each_char.with_index do |char, index|
      next if b[index] == char
      result += 1
    end
    result
  end
end

module BookKeeping
  VERSION = 3
end