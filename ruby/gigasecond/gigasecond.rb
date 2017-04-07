class Gigasecond
  def self.from(birth)
    Time.at(birth.to_i + 10**9)
  end

  def self.test_bookkeeping
    BookKeeping::VERSION
  end
end

module BookKeeping
  VERSION = 5
end