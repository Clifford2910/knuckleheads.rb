# frozen_string_literal: true

module Knuckleheads
  module Auditable
    def audit
      puts "Rolled a #{number} (#{self.class})"
    end
  end
end
