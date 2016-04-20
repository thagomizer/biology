# ATGCAACT
# A: 5 1 0 0 5 5 0 0
# C: 0 0 1 4 2 0 6 1
# G: 1 1 6 3 0 1 0 0
# T: 1 5 0 0 0 1 1 6

require 'pp'
require '../fasta'

dnas = Fasta.new("cons.txt").read_dnas
len = dnas.values.first.length

results = Hash.new { |h, k| h[k] = Array.new(len) { 0 } }

dnas.each_value do |dna|
  dna.str.each_char.with_index do |bp, i|
    results[bp][i] += 1
  end
end

len.times do |i|
  print results.max_by { |bp, ary| ary[i] }.first
end

puts

results.each do |h, k|
  puts "#{h}: #{k.join(' ')}"
end
