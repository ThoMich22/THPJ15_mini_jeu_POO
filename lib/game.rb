require 'pry'

class Game 
    attr_accessor :human_player, :enemies
    

    def initialize (name_of_game)
        @name_of_game = name_of_game
        @human_player = "Wolverine"
        @enemies = ["player1", "player2", "player3", "player4"]
       
        
    end

    def kill_player(player)
        

end

binding.pry 
