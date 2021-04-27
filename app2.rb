require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

ennemies = []

#Accueil
puts " _________________________________________________"
puts "|       Welcome in the wonderfull world of        |"
puts "|                THEY ALL WANT MY POO             |"
puts "|_________________________________________________|"

puts ""



#Character generator
puts ""
puts "Wtf is your fooking name ?"
print "> "
name = gets.chomp
player_1 = HumanPlayer.new("#{name}")
puts ""
puts "What the foock is that name ?? You bloody prick !"
puts "Anyway... 
Welcome in the world of THEY ALL WANT MY POO, looser #{name} !"
puts ""
puts "Say thank you !"
print "> "
thank_you = gets.chomp
while thank_you != "thank you"
  puts "Say thank you, moron !"
  print "> "
  thank_you = gets.chomp
end

#Creation of the ennemies
puts ""
puts "To begin that crapy adventure, you will fight your two worse ennemies"
puts ""
puts "You know them since the kindergarden..."
puts "Jessie et James de la team Rocket"

player_2 = Player.new("Jessie")
player_3 = Player.new("James")

ennemies << player_2
ennemies << player_3

#Fighto 
puts ""
puts "Yours ennemies are coming !"
puts ""
puts "Jessie : Nous sommes de retour.
James : Pour vous jouer un mauvais tour.
Jessie : Afin de préserver le monde de la dévastation.
James : Afin de rallier tous les peuples à notre nation.
Jessie : Afin d'écraser l'Amour et la Vérité.
James : Afin d'étendre notre pouvoir jusqu'à la Voie Lactée.
Jessie : Jessie.
James : James.
Jessie : La Team Rocket, plus rapide que la lumière.
James : Rendez-vous tous ou ce sera la guerre.
Miaouss : Miaouss, oui la guerre !"
puts ""
puts "Who the fock is Miaouss ? And in what foucking language are they talking ?"
puts ""

puts "Who the hell are they ?"
print "> "
wrong = gets.chomp
puts ""
puts"..."
puts "You are fucking wrong..."
puts "Bloody asshole"
puts "Anyway.."
puts ""

puts "Lets fight !"
puts ""


while player_1.life_points > 0 || player_2.life_points > 0 && player_3.life_points > 0
  puts player_1.show_state
  
  puts ""
  puts ""
  puts "It is your turn, what do you want to do ?"
  puts ""
  puts "1 - to search a new and better weapon"
  puts "2 - to search health pack"

  
  puts "3 - attack this crazy Jessie. #{player_2.show_state}"
   
  puts "4 - attack this crazy James. #{player_3.show_state}"

  puts "5 - if you want to leave that wonderfull game"
  puts ""
  print "> "
  choice = gets.chomp.to_i
  if choice == 1
    player_1.search_weapon
    elsif choice == 2
      player_1.search_health_pack
      elsif choice == 3 
        if player_2.life_points < 0
          puts "You are a bloody moron... She is already dead"
        end
      player_1.attack(player_2)
        elsif choice == 4
          if player_3.life_points < 0
            puts "You are a bloody moron... He is already dead"
          end
          player_1.attack(player_3)
          elsif choice == 5
            puts "Son of a ..."
            exit
        end
  puts ""
  puts "It is the turn of your ennemies..."
  puts ""
  if player_2.life_points > 0
    puts player_2.attack(player_1)
    puts "Damn Jessie"
  end
  puts ""
  if player_3.life_points > 0
    puts player_3.attack(player_1)
    puts "Damn James"
  end

  if player_1.life_points <= 0
    puts "You died you stupid people (we are inclusive in this company, NewEpicGame)"
    break
    elsif player_2.life_points <= 0 && player_3.life_points <= 0
      puts "You win but they were pretty weak, you jackass.."
      break
      
  end
end
      