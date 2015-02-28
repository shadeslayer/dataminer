# encoding: utf-8

require 'json'

# Party class
class Party
  attr_accessor :votes
  attr_accessor :party_id
  attr_accessor :community_id
  attr_accessor :province_id
  attr_accessor :district_id
  attr_accessor :name

  def initialize(s:, partyMetaData:)
    # Data on how things are matched :
    #   First 2 characters are election type
    #   Next 4 characters are year
    #   Next 2 characters are month
    #   Next 2 characters are province id
    #   Next 3 characters community id
    #   Next 2 characters are district id
    #   Next 6 characters are party id
    #   Next 8 characters are vote count
    # We get a array of arrays back
    match = s.scan(/(\w{2})(\d{4})(\d{2})(\d{2})(\d{3})(\d{2})(\d{6})(\d{8})/)
    match.flatten!
    @str = s
    @votes = match[-1]
    @party_id = match[-2]
    @district_id = match[-3]
    @community_id = match[-4]
    @province_id = match[-5]
    @name = partyMetaData[@party_id.to_i]
  end
end
