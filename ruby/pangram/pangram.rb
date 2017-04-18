class Pangram
  def self.pangram?(phrase)
    phrase.upcase!
    included = 0
    ('A'..'Z').to_a.each do |letter|
      included += 1 if phrase.include?(letter)
      return true if included == 26
    end
    included == 26
  end
end


module BookKeeping
  VERSION = 4
end
