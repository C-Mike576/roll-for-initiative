class RollForInitiative::Scraper

    @@site = "https://www.dndbeyond.com/classes"

    def klasses(site)

        @@doc = Nokogiri::HTML(open(site, "User-Agent" => "Mozilla/5.0 (Windows NT 6.0; rv:12.0) Gecko/20100101 Firefox/12.0 FirePHP/0.7.1"))
        
    end

    def grab_encounter(site)

        more_info = Nokogiri::HTML(open(site, "User-Agent" => "Mozilla/5.0 (Windows NT 6.0; rv:12.0) Gecko/20100101 Firefox/12.0 FirePHP/0.7.1"))
        @@encounter = more_info.search(".content-container p").first.text
    end

    def self.doc
        @@doc
    end

    def self.encounter
        @@encounter
    end


end









#"https://www.dndbeyond.com/classes"