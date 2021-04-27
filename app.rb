require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "A ma droite Josiane" 
player_1 = Player.new("Josiane")
puts "A ma gauche José" 
player_2 = Player.new ("José")
puts "Présentons les deux combattants :" 
puts player_1.show_state
puts player_2.show_state

puts "Fight ! Passons à l'attaque :"
puts "Josiane aura l'honneur d'attaquer la première"
puts player_1.attack(player_2)

puts "José ne va pas se laisser faire !"
puts player_2.attack(player_1)

while player_1.life_points > 0 || player_2.life_points > 0
  puts player_1.show_state
  puts player_2.show_state

  puts "Josiane attaque à son tour !"
  puts player_1.attack(player_2)
    if player_2.life_points < 0
      break 
    elsif player_2.life_points < 0
      break 
    else 
      puts "José attaque à son tour !"
      puts player_2.attack(player_1)
    end
end

binding.pry