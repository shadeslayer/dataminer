# encoding: utf-8

require_relative 'party'
require_relative 'partymetadata'

# Class for providing data at a community
# level.

class Community
  attr_accessor :parties
  attr_accessor :votes
  # Null votes and other data as well

  def initialize(votedata:, partydata:)
    @parties = []
    @votedata = votedata
    @partydata = partydata
  end

  def generate
    party_meta_data = PartyMetaData.new(data: @partydata)
    File.readlines(@votedata).each do |str|
      str.strip!
      @parties << Party.new(s: str, partyMetaData: party_meta_data)
    end
  end
end
