require 'pry'
class Sieve
  attr_accessor :primes
  def initialize(limit)
    @limit = limit
    @range = (2..limit).to_a
  end
 
  def primes
    composites = []
    @range.reject! do |item|
      i = 2
      composite = item
      while composite <= @limit
        composite = item * i
        i += 1
        composites.push(composite)
      end
      composites.include?(item)
    end
    @range
  end
end

module BookKeeping
  VERSION = 1
end
