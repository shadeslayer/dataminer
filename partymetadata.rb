# encoding: utf-8

# Data about each of the parties
class PartyMetaData < Array

  def initialize(data:)
    File.readlines(data).each do |s|
      match = s.scan(/(\w{2})(\d{4})(\d{2})(\d{6})([[:print:]]{,50})([[:print:]]{,150})/)
      match.flatten!
      match[4].strip!
      match[5].strip!
      self[match[3].to_i] = { 'shortName' => match[4], 'fullName' => match[5] }
    end
  end
end
