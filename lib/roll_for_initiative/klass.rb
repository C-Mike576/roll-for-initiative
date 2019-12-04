class RollForInitiative::Klass
    attr_accessor :name, :short, :klass_url, :more_info

    #this is the container holding the objects
    @@all = []

    #this should be just the array of klasses as strings
    @@klass_name_list = []


    def initialize(name)
        @name = name
        @@all << self
    end

   

    def self.get_klass_names
        
        klass_list = RollForInitiative::Scraper.doc.search(".listing-card__content")
        klass_list.each do |klass_info|
            new_klass = RollForInitiative::Klass.new(klass_info.search(".listing-card__title").text.strip)
            @@klass_name_list << klass_info.search(".listing-card__title").text.strip.downcase
            new_klass.short = klass_info.search(".listing-card__description p").first.text.strip
            new_klass.klass_url = klass_info.search("a").first["href"] #>/classes/'theclass'
        end
    
    
    end

    def self.all
        @@all
    end

    def self.klass_name_list
        @@klass_name_list
    end

end
