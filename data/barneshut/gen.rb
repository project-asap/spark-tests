#!/usr/bin/ruby

#ruby  generator for Nbody particles
# @1 (Int): number of particles
# @2 (Int): quadrant length
# @3 (Int): maximum mass
#
#

require 'optparse'

ARGV << '-h' if ARGV.empty?

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: particleGen.rb [options]"

  opts.on("-o","--output O",String,"output file"){ |o| options[:output] = o }

  opts.on("-l", "--length L", Integer, "Length") { |l| options[:length] = l }

  opts.on("-m", "--width W", Integer, "Width") { |m| options[:mass] = m }

  opts.on("-N","--number N",Integer,"Number"){ |n| options[:nparticles] = n}

  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end

end.parse!



$nparticles = options[:nparticles].to_i
$maxM = options[:mass].to_f
$maxL = options[:length].to_f

#$output = File.new( options[:output] , 'w') if( options[:output] )

puts( $maxM )
puts( $maxL )
puts( $nparticles )
puts( $output )

$output = STDOUT
$output = File.open(options[:output],'w') if( options[:output] )

ran = Random.new

$nparticles.times do |i|

  locationX = ran.rand(0..$maxL )
  locationY = ran.rand(0..$maxL )
  mass = ran.rand(0..$maxM)

  $output.puts("%i %f %f %f\n" %[i,locationX,locationY,mass] )

end

$output.close() if( options[:output] )
