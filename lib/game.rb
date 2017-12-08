class Game

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @turn_player = player_1
  end

  def attack(player)
      player.receive_damage
      @turn_player = player
  end

  def turn_player
    @turn_player
  end

  def p1
    @players.first
  end

  def p2
    @players.last
  end
end
