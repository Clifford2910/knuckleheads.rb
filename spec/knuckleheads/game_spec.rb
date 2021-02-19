# frozen_string_literal: true

require 'knuckleheads/game'

module Knuckleheads
  describe Game do
    before do
      @game = Game.new('Knuckleheads')

      @initial_health = 100
      @player = Player.new('moe', @initial_health)
      @player2 = Player.new('barney', @initial_health)

      
      @game.add_player(@player)
      @game.add_player(@player2)
    end

    it 'has a title' do
      expect(@game.title).to eq('Knuckleheads')
    end

    it 'w00ts the player if a high number is rolled' do
      Die.any_instance.stub(:roll).and_return(5)
      @game.play(2)

      expect(@player.health).to eq(@initial_health + (15 * 2))
    end

    it 'skips the player if a medium number is rolled' do
      Die.any_instance.stub(:roll).and_return(3)
      @game.play(2)

      expect(@player.health).to eq(@initial_health)
    end

    it 'blams the player if a low number is rolled' do
      Die.any_instance.stub(:roll).and_return(1)
      @game.play(2)

      expect(@player.health).to eq(@initial_health - (10 * 2))
    end

    it "assigns a treasure for points during a player's turn" do
      @game.play(1)

      expect(@player.points).to_not eq(0)
    end

    it 'computes total points as the sum of all player points' do
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player2.found_treasure(Treasure.new(:crowbar, 400))

      expect(@game.total_points).to eq(500)
    end
  end
end
