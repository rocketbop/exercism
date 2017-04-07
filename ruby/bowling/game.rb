class Game
 def initialize()
   @score = 0
   @frame = []
 end  


  def roll(pin)
    if @Frame.size == 0
      @frame[0] = pin
    else @frame.size == 1
      @frame.push pin
    elsif @frame === 2
      
    end  
    @last = pin

    @score += pin
  end

  def score
    @score
  end
end
