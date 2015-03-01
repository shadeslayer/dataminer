# encoding: utf-8
require 'csv'

require_relative 'parties'
# Class for providing data at a community
# level.
class City
  attr_accessor :name
  attr_accessor :parties

  def initialize(data_hash:)
    @name = data_hash['Name']
    @parties = Parties.new(data_hash: data_hash)
  end
end
