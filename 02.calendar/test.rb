#!/usr/bin/env ruby

require 'optparse'
opt = OptionParser.new
test = ["a","b","c"]
opt.on('-a [VAL]') {|v| p v }
opt.on('-b') {|v| p v }

opt.parse!(ARGV)
p ARGV