class Die
  def initialize(sides)
    @range = 1..sides
  end

  def roll
    rand(@range)
  end
end
