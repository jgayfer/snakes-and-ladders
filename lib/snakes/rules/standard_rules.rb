require_relative 'rules_interface'

module Snakes
  module Rules
    class StandardRules < RulesInterface
      def initialize(die)
        @die = die
      end

      def roll_dice
        @die.roll
      end
    end
  end
end
