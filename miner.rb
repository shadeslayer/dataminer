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
    puts "Start dumping to out.json"
    Oj.to_file('out.json', self)
  end
end
