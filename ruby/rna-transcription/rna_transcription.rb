require "pry"

class Complement
  def self.map
    {
      "G" => "C",
      "C" => "G",
      "T" => "A",
      "A" => "U"
    }
  end

  def self.of_dna(sequence)
    sequence.each_char.map do |char|
      compliment = map[char]
      return "" if compliment.nil?
      compliment
    end.join
  end
end

module BookKeeping
  VERSION = 4
end
