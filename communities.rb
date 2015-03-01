# encoding: utf-8
require 'csv'

require_relative 'parties'
# Class for providing data at a community
# level.
class Communities
  attr_accessor :name
  attr_accessor :parties

  def initialize(data_hash:)
    @name = 'Magic'
    @parties = Parties.new(data_hash: data_hash)
    p @parties
    # Surprise! Multi hash!
    data = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
    CSV.foreach('data/15codmun_en.csv') do |row|
      data[row[0]][row[1]] = row[3]
    end
  end
end
