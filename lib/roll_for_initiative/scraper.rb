class RollForInitiative::Scraper


    def initialize(site)

        @@doc = Nokogiri::HTML(open(site, "User-Agent" => "Mozilla/5.0 (Windows NT 6.0; rv:12.0) Gecko/20100101 Firefox/12.0 FirePHP/0.7.1"))
        
    end

    def self.doc
        @@doc
    end

end









#"https://www.dndbeyond.com/classes"