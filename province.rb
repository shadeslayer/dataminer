require_relative 'city'

# Super class that encapsulates Provinces in a region of Spain, for eg.
# Andulucia
# Data representation :
#   {"result" => {},
#    "communities" => []
#   }
class Province
  attr_accessor :cities
  attr_reader :vote_data
  attr_reader :party_data

  def initialize(data_hash:)
    @vote_data = data_hash['vote_data']
    @party_data = data_hash['party_data']
    @name = data_hash['Name']
    @id = data_hash['id']
    data = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
    CSV.foreach('data/15codmun_en.csv') do |row|
      next unless row[0] == data_hash['id']
      data[row[0]][row[1]] = row[3]
    end

    @cities = []
    data[data_hash['id']].keys.each do |key|
      data_hash['Name'] = data[data_hash['id']][key]
      @cities << City.new(data_hash: data_hash)
    end
  end
end
