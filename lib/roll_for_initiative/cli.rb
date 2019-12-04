#CLI controller
class RollForInitiative::CLI
    attr_accessor :player_name, :klasses
    def call
        welcome_msg
        klass_list
    end

    def welcome_msg
        puts "Welcome to The Dragon Province!"
        puts "'exit' can be entered at any time to leave"
        sleep(1)
        puts "Please, enter your name:"
        @player_name = gets.strip
        if @player_name.downcase == 'exit'
            goodbye
        end
        sleep(2)
        puts "What a curious name..."
        sleep(2)
    end

    def klass_list
        puts "Choose your class mortal:"
        sleep(1)
        @klasses = RollForInitiative::Klass.list_klasses
        @klasses.each do |klass|
            puts "#{klass.name}"
        end
        klass_choose
    end

    def klass_choose    
        puts "I'm a very particular god the class must be spelled right. OR ELSE!!!"
        @klass_picked = nil
        @klass_picked = gets.strip.downcase
            
        if RollForInitiative::Klass.klass_name_list.include?(@klass_picked)
            RollForInitiative::Klass.all.each do |type|
                if type.name == @klass_picked.capitalize
                    puts type.short
                    puts "Does this sound good to you? (y/n)"
                    input = gets.strip.downcase
                    case input
                        when "y"
                            @chosen_klass = type
                            picked
                        when "n"
                            klass_list
                        when "exit"
                            goodbye
                    end
                end
            end
        elsif @klass_picked == 'exit'
                goodbye    
        else
            puts "You are trying my patience. Check your spelling!"
            klass_list
        end
    end

    def picked
        puts "Time to adventure #{@player_name} the #{@chosen_klass.name}"
        goodbye
    end

    def goodbye
        puts "Goodbye...for now."
        sleep(1)
        exit
    end


end


