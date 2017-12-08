require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double(:player_1, receive_damage: -10) }
  let(:player_2) { double(:player_2, receive_damage: -10) }


  describe 'attack' do
    it "damages a player" do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

  describe '#p1' do
    it 'retreives player 1' do
      expect(game.p1).to eq player_1
    end
  end

  describe '#turn_player' do
    it 'is player_1\'s turn at the start of the game' do
      expect(game.turn_player).to eq player_1
    end

    it 'is player_2\'s turn after player_1 makes an attack' do
      game.attack(player_2)
      expect(game.turn_player).to eq player_2
    end
    it 'is player_1\'s turn after player_2 makes an attack' do
      game.attack(player_2)
      game.attack(player_1)
      expect(game.turn_player).to eq player_1
    end
  end
end
