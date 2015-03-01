require_relative 'communities'

# Super class that encapsulates Provinces in a region of Spain, for eg.
# Andulucia
# Data representation :
#   {"result" => {},
#    "communities" => []
#   }
class Province
  attr_accessor :communities
  attr_reader :vote_data
  attr_reader :party_data

  def initialize(data_hash:)
    @vote_data = data_hash['vote_data']
    @party_data = data_hash['party_data']
    @name = data_hash['Name']
    @id = data_hash['id']
    @communities = Communities.new(data_hash: data_hash)
  end
end
