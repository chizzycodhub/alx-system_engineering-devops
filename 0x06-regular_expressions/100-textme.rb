#!/usr/bin/env ruby
# A script that runs some statistics on the TextMe app.
# Requirements:
# Your script should output: [SENDER],[RECEIVER],[FLAGS]
# The sender phone number or name (including country code if present)
# The receiver phone number or name (including country code if present)
# The flags that were used

sender = ARGV[0].scan(/\[from:(.*?)\]/).flatten.join
receiver = ARGV[0].scan(/\[to:(.*?)\]/).flatten.join
flags = ARGV[0].scan(/\[flags:(.*?)\]/).flatten.join
puts "#{sender},#{receiver},#{flags}"
