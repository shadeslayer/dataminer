require_relative 'community'

# Super class that encapsulates Provinces in a region of Spain, for eg.
# Andulucia
# Data representation :
#   {"result" => {},
#    "communities" => []
#   }
class Provinces
  attr_accessor :result
  attr_accessor :communities
  attr_accessor :name

  def initialize(data_hash:)
    @result = data_hash [:result]
    @name = data_hash[:name]
    @communities = {}
    data_hash[:communities].each do |community|
      @communities Community.new()
    end
  end
end
