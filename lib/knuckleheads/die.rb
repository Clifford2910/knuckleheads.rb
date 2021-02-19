# frozen_string_literal: true

require_relative 'auditable'

module Knuckleheads
  class Die
    include Auditable

    attr_reader :number

    def initialize
      roll
    end

    def roll
      @number = rand(1..6)
      audit
      @number
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  die = Knuckleheads::Die.new
  puts die.roll
  puts die.roll
  puts die.roll
end
