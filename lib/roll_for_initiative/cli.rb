#CLI controller
class RollForInitiative::CLI
    attr_accessor :player_name, :klasses



    @@site = "https://www.dndbeyond.com/classes"



    def call
        RollForInitiative::Scraper.new.klasses(@@site)
        RollForInitiative::Klass.get_klass_names
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
        @klasses = RollForInitiative::Klass.all
        @klasses.each do |klass|
            puts "#{klass.name} - #{klass.short}"
        end
        sleep(1)
        klass_choose
    end

    def klass_choose    
        puts "I'm a very particular god the class must be spelled right. OR ELSE!!!"
        @klass_picked = nil
        @klass_picked = gets.strip.downcase

        if RollForInitiative::Klass.klass_name_list.include?(@klass_picked)
            RollForInitiative::Klass.all.each do |type|
                if type.name == @klass_picked.split.map(&:capitalize).join(' ')
                    RollForInitiative::Scraper.new.grab_encounter(@@site.gsub('/classes', type.klass_url))
                    puts "#{RollForInitiative::Scraper.encounter}"
                    sleep(2)
                    puts "Does this sound like you? (y/n)"
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
            sleep(2)
            klass_list
        end
    end

    def picked
        puts "Time for adventure #{@player_name} the #{@chosen_klass.name}."
        sleep(1)
        adventure
    end

    def adventure
        puts "You fight a person"
        sleep(1)
        goodbye
    end

    def goodbye
        puts "Goodbye...for now."
        exit
    end


end


