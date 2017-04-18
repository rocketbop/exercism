class Pangram
  def self.pangram?(phrase)
    alphabet = ('A'..'Z').to_a
    phrase.upcase.each_char do |char|
      alphabet.delete_if { |letter| letter == char }
      return true if alphabet.empty?
    end
    alphabet.empty?
  end
end

module BookKeeping
  VERSION = 4
end

