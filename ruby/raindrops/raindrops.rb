class Raindrops
  RAINDROPS = { 3 => "Pling", 5 => "Plang", 7 => "Plong" }

  def self.convert(target)
    result = ''
    RAINDROPS.each do |factor, sound|
      result << sound if (target % factor).zero?
    end
    result.empty? ? target.to_s : result
  end
end

module BookKeeping
  VERSION = 3
end
