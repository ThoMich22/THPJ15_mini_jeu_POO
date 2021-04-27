require 'pry'

class Player
    attr_accessor :name, :life_points
    
    def initialize (player_name)
        @name = player_name
        @life_points = 10

    end

    def show_state
        
        if @life_points <= 0 
            puts "#{@name} a 0 point de vie"
        else puts "#{@name} a #{@life_points} points de vie"

        end

    end

    def gets_damage(number_of_damage)
        
        @life_points = @life_points - number_of_damage 
        
        if @life_points <= 0 
            puts "Le joueur #{@name} a été tué"
        
        end

    end

    def attacks(player_attacked)
        
        puts "#{@name} attaque le joueur #{player_attacked.name}"

        y = compute_damage
        player_attacked.gets_damage(y)
        puts "il lui inflige #{y} points de dommages"
        
    end

    def compute_damage
        return rand(1..6) 
    end

    
end

class HumanPlayer < Player
    attr_accessor :name, :life_points, :weapon_level

    def initialize (player_name)
        super (player_name)
        @life_points = 100
        @weapon_level = 1

        
    end

    def show_state
        
        if @life_points <= 0 
            puts "#{@name} a 0 point de vie"
        else puts "#{@name} a #{@life_points} points de vie et une arme niveau #{@weapon_level}"

        end

    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon

        new_weapon = rand(1..6) 

        puts "Tu as trouvé une arme de niveau #{new_weapon}"
        
        if new_weapon > @weapon_level
            @weapon_level = new_weapon
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
            
        elsif new_weapon < @weapon_level
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end


    end

    def search_health_pack
        result = rand(1..6)

        if result == 1
            puts "Tu n'as rien trouvé"

        elsif result > 1 || result <= 5
            @life_points = @life_points + 50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"

            if @life_points > 100 
                @life_points = 100
            end

        elsif result == 6
            @life_points < 100
            @life_points = @life_points + 80 
            puts "Waow, tu as trouvé un pack de +80 points de vie !"

            if @life_points > 100 
                @life_points = 100
            end

        end


    end




end

#binding.pry
