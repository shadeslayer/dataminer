# encoding: utf-8
require 'csv'

require_relative 'parties'
# Class for providing data at a community
# level.
class City
  attr_accessor :name
  attr_accessor :id
  attr_accessor :parties
  attr_accessor :result

  def initialize(data_hash:)
    @name = data_hash['Name']
    @id = data_hash['cid']
    @parties = Parties.new(data_hash: data_hash)

    total_votes = 0.0
    parties.each do |party|
      total_votes += party['vote_count']
    end

    @result = {}
    @result['parties'] = []
    parties.each do |party|
      @result['parties'] << {
        'name' => party['name']['shortName'],
        'total_votes' => total_votes,
        'vote_count' => party['vote_count'],
        'percentage' => (party['vote_count'] / total_votes) * 100 }
    end
  end
end
