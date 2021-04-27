require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "

-----------------------------------------------------------
|                                                          | 
|       Bienvenue sur 'ILS VEULENT TOUS MA POO' !          |
|     Le but du jeu est d'être le dernier survivant !      |
|                                                          |
-----------------------------------------------------------

"

#Je définis le nom de mon personnage
puts "Quel nom veux-tu donner à ton personnage ?"
print ">"
name = gets.chomp
user = HumanPlayer.new("#{name}")

#je crée un array dans lequel je stockerai mais énemies 
@enemies = []
#voici la liste de mes énemies
player1 = Player.new("Josiane")
player2 = Player.new("José")
@enemies = [player1, player2]

#debut de la boucle de jeu 
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    puts ""
    puts "Voici l'état de ton joueur"
    puts "---------------------------------------------" 
    puts user.show_state

    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"

    puts ""

    puts "attaquer un joueur en vue :"
    enemies.each do |player| 
        if player.life_points > 0 
            print "#{@enemies.find_index(player)} - "
            puts player.show_state
        end
    end

    action_to_make = gets.chomp

    puts "
    
    "

    if action_to_make == "a" 
        puts user.search_weapon
    
    elsif action_to_make == "s"
        puts user.search_health_pack
    
    elsif action_to_make == "0" 
        puts user.attacks(player1)

    elsif action_to_make == "1"
        puts user.attacks(player2)
    end


    puts "   

 |----------------------------------|
 | Les autres joueurs t'attaquent ! |
 |----------------------------------|
    
    "

    enemies.each do |player| 
        if player.life_points > 0 
            puts player.attacks(user)
        end
    end

end

puts "BRAVO ! TU AS GAGNE !"




