require_relative 'city'

# Super class that encapsulates Provinces in a region of Spain, for eg.
# Andulucia
# Data representation :
#   {"result" => {},
#    "communities" => []
#   }
class Province
  attr_accessor :name
  attr_accessor :cities
  attr_accessor :result

  def initialize(data_hash:)
    @name = data_hash['Name']
    @id = data_hash['id']
    @@data = Hash.new { |h, k| h[k] = Hash.new }
    CSV.foreach('data/15codmun_en.csv') do |row|
      next unless row[0] == data_hash['id']
      @@data[row[0]][row[1]] ||= row[3]
    end

    @cities = []
    @@data[data_hash['id']].each_key do |key|
      data_hash['Name'] = @@data[data_hash['id']][key]
      data_hash['cid'] = key
      @cities << City.new(data_hash: data_hash)
    end

    @result = {}
    @result['parties'] = []
    total_votes = 0.0

    party_data = {}
    @cities.each do |city|
      # Some new cities like Dehesas Viejas haven't held elections yet
      # Pass over if that's the case
      next if city.result['parties'][0].nil?
      total_votes += city.result['parties'][0]['total_votes']

      # Iterate over each city and keep the data of each party in a hash
      # This is a funky merge written at 6 AM.
      city.result['parties'].each do |party|
        party_data[party['name']] ||= { 'vote_count' => 0.0 }
        party_data[party['name']].merge!(party) { |key, oldval, newval|
          newval += oldval if key == 'vote_count'
        }
      end
    end

    total = 0.0
    party_data.each_key do |key|
      party_data[key]['total_votes'] = total_votes
      party_data[key]['percentage'] = (party_data[key]['vote_count'] / total_votes) * 100
      #FIXME: This should probably happen above with the merge block
      party_data[key]['name'] = key
      @result['parties'] << party_data[key] unless party_data[key]['percentage'] < 5
      total += party_data[key]['percentage']
    end
    puts "Oh noes! #{total}" if total != 100
  end
end
