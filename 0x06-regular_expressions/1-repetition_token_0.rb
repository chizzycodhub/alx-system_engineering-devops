#!/usr/bin/env ruby
# a Ruby script that accepts one argument and pass it to a regular expression matching method to repeat a token

puts ARGV[0].scan(/hbt{2,5}n/).join
