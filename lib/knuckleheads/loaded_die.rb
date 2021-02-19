# frozen_string_literal: true

require_relative 'auditable'

module Knuckleheads
  class LoadedDie
    include Auditable

    attr_reader :number

    def roll
      numbers = [1, 1, 2, 5, 6, 6]
      @number = numbers.sample
      audit
      @number
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  die = Knuckleheads::LoadedDie.new
  puts die.roll
  puts die.roll
  puts die.roll
end
