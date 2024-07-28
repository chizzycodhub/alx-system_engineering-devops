#!/usr/bin/env ruby
# a Ruby script that accepts one argument and pass it to a regular expression matching method to repeat a token zero or more times

puts ARGV[0].scan(/hbt*n/).join
