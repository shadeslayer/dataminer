require_relative 'region'
require 'oj'
class Miner
  attr_accessor :regions
  def initialize(data_hash:)
    @regions = []
    data_hash.keys.each do |region|
      puts "Processing #{region}"
      @regions << Region.new(data_hash: data_hash[region])
    end
  end

  def dump
    File.write('out.json', JSON.pretty_generate(Oj.dump(self)))
  end
end
