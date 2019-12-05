require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative "./roll_for_initiative/version"
require_relative './roll_for_initiative/cli'
require_relative './roll_for_initiative/klass'
require_relative './roll_for_initiative/scraper'

module RollForInitiative
    class Error < StandardError; end
    # Your code goes here...
end
  
RollForInitiative::CLI.new.call