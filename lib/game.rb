require "pry"

class Game
  attr_accessor :human_player
  attr_accessor :ennemies


  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @ennemies = []
    
    4.times do |i|
      player = Player.new("bot#{i}")
      @ennemies <<  player
    end
  end

  def kill_player(ennemy)
    @ennemies >> ennemy
  end

  def is_still_ongoing?
    if  @ennemies.length > 0 || @human_player.life_points > 0
      true
    else
      false
    end
  end

  def show_players
    @human_player.show_state
    
    @ennemies.each do |ennemy|
      ennemy.show_state
    end
  end

end

