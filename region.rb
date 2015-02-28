require_relative 'provinces'

# Super class which encapsulates all Provinces in Spain
# Data representation :
#   { "Andulucia" => {data} }
class Region
  attr_accessor :provinces

  # Pass a data hash which contains a Region => Data file mapping
  def initialize(data_hash:)
    @provinces = {}
    data_hash.keys.each do |province|
      @provinces[province] = Provinces.new(data_hash[province])
    end
  end
end
