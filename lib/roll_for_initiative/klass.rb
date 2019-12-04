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

    def self.list_klasses
        self.scrape_klass_name
        @@all
    end

    def self.scrape_klass_name
        doc = Nokogiri::HTML(open("https://www.dndbeyond.com/classes", "User-Agent" => "Mozilla/5.0 (Windows NT 6.0; rv:12.0) Gecko/20100101 Firefox/12.0 FirePHP/0.7.1"))
        klass_list = doc.search(".listing-card__content")
        
        klass_list.each do |klass_info|
            new_klass = RollForInitiative::Klass.new(klass_info.search(".listing-card__title").text.strip)
            @@klass_name_list << klass_info.search(".listing-card__title").text.strip.downcase
            new_klass.short = klass_info.search(".listing-card__description p").first.text.strip
        end
    
    
    end

    def self.all
        @@all
    end

    def self.klass_name_list
        @@klass_name_list
    end

end
