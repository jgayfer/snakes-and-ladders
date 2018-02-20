require_relative 'rules_interface'

class StandardRules < RulesInterface
  def initialize(die)
    @die = die
  end

  def roll_dice
    @die.roll
  end
end
