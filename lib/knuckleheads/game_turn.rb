# frozen_string_literal: true

require_relative 'player'
require_relative 'die'
require_relative 'loaded_die'
require_relative 'treasure_trove'

module Knuckleheads
  module GameTurn
    def self.take_turn(player)
      die = Die.new
      case die.roll
      when 1..2
        player.blam
      when 3..4
        puts "#{player.name} was skipped."
      else
        player.w00t
      end
      
      treasure = TreasureTrove.random
      player.found_treasure(treasure)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  player = Knuckleheads::Player.new('curly', 125)
  Knuckleheads::GameTurn.take_turn(player)
end
