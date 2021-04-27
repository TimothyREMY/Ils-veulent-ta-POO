require "pry"

class Player
  attr_accessor :name
  attr_accessor :life_points


  def initialize(name)
    @name = name
    @life_points = 10
  end


  def show_state
    return "Il reste #{@life_points} points de vie à #{@name}"
  end


  def gets_damage(number_damage)
    @life_points = @life_points - number_damage
      if @life_points > 0 
        puts "Oh non, #{@name} a reçu #{number_damage} de dégats ! Il lui reste donc #{@life_points} points de vie. Attention !"
      else
        puts "#{name} a été tué..."
      end
  end



  def attack(player)
    puts "#{self.name} attaque #{player.name} !"
    compute_damage
    number_damage = compute_damage
    player.gets_damage(number_damage)
  end


  def compute_damage
    return rand(1..6)
  end


end


class HumanPlayer < Player
  attr_accessor :weapon_level
  
  def initialize(name)
    super(name)
    @life_points = 100
    
    @weapon_level = 1
    
  end

  def show_state
    return "Il vous reste #{@life_points} points de vie et votre arme est au niveau #{weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon 
    dice_of_destiny = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice_of_destiny}"
    if @weapon_level < dice_of_destiny
      @weapon_level = dice_of_destiny
    else
      puts "Foocking cunt, this new weapon is not better than the one I already have"
    end
  end

  def search_health_pack
    dice_of_destiny = rand(1..6)
    puts dice_of_destiny
    if dice_of_destiny == 1
      puts "Tu n'as rien trouvé..."
      @life_points
    elsif dice_of_destiny == 2 || dice_of_destiny == 3 || dice_of_destiny == 4 || dice_of_destiny == 5
        puts "Bravo, tu as trouvé un pack de 50 points de vie"
        @life_points = @life_points + 50
      if @life_points > 100
        @life_points = 100
      end
    elsif dice_of_destiny == 6
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
        @life_points = @life_points + 80
        if @life_points > 100
          @life_points = 100
        end
    end
  end
end