# encoding: utf-8

require_relative 'community'
require 'pp'
require 'yaml'
require 'oj'

community = Community.new(votedata: 'data/DATCANDMUNI_PA_1203.DAT', partydata: 'data/DATCAND_PA_1203.DAT')

community.generate

puts Oj.dump community
