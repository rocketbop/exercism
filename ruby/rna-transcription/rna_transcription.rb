require "pry"

class Complement
  DNA_TO_RNA = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }

  def self.of_dna(sequence)
    sequence.each_char.map do |char|
      compliment = DNA_TO_RNA[char]
      return "" if compliment.nil?
      compliment
    end.join
  end
end

module BookKeeping
  VERSION = 4
end
