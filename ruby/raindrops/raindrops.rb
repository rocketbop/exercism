class Raindrops
  def self.convert(number)
    result = ''
    result << "Pling" if factor_of?(factor: number, product: 3)
    result << "Plang" if factor_of?(factor: number, product: 5)
    result << "Plong" if factor_of?(factor: number, product: 7)
    result.empty? ? number.to_s : result
  end

  def self.factor_of?(factor:, product:)
    (factor % product).zero?
  end
end

