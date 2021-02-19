# frozen_string_literal: true

require_relative 'player'

module Knuckleheads
  class ClumsyPlayer < Player
    def found_treasure(treasure)
      damaged_treasure = Treasure.new(treasure.name, treasure.points / 2)
      super(damaged_treasure)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  clumsy = Knuckleheads::ClumsyPlayer.new('klutz')
  hammer = Knuckleheads::Treasure.new(:hammer, 50)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  crowbar = Knuckleheads::Treasure.new(:crowbar, 400)
  clumsy.found_treasure(crowbar)
  clumsy.each_found_treasure do |treasure|
    puts "#{treasure.points} total #{treasure.name} points"
  end
  puts "#{clumsy.points} grand total points"
end
