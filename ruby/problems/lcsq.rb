# Problem
# A string u is a common subsequence of strings s and t if the symbols
# of u appear in order as a subsequence of both s and t. For example,
# "ACTG" is a common subsequence of "AACCTTGG" and "ACACTGTGA".

# Analogously to the definition of longest common substring, u is a
# longest common subsequence of s and t if there does not exist a
# longer common subsequence of the two strings. Continuing our above
# example, "ACCTTG" is a longest common subsequence of "AACCTTGG" and
# "ACACTGTGA", as is "AACTGG".

# Given:
# Two DNA strings s and t (each having length at most 1 kbp) in FASTA format.

# Return:
# A longest common subsequence of s and t. (If more than one solution
# exists, you may return any one.)

# Sample Dataset
# >Rosalind_23
# AACCTTGG
# >Rosalind_64
# ACACTGTGA

# Sample Output
# AACTGG

require 'pp'
require '../fasta'

dna1, dna2 = Fasta.new("lcsq.txt").read_dnas.values.map(&:str).sort_by(&:length)

## This is a dynamic programming problem. Starting with a single
## character we want to know where that character is found after a
## specific point in the string. location["A", 5] should equal the
## index of a specific character starting at character 5.

bases = %w[A C G T]

location1 = Hash.new { |h, k| h[k] = {} }
location2 = Hash.new { |h, k| h[k] = {} }

(0...dna1.length).each do |offset|
  bases.each do |base|
    location1[offset][base] = dna1.index(base, offset) || 1001
  end
end

(0...dna2.length).each do |offset|
  bases.each do |base|
    location2[offset][base] = dna2.index(base, offset) || 1001
  end
end

pp location1
pp location2

offset1 = 0
offset2 = 0
# loop do

#   base1, val1 = location1[offset1].min_by { |_, v| v }
#   base2, val2 = location2[offset2].min_by { |_, v| v }

#   binding.pry

#   if base1 != base2 then
#     val2 = location2[offset2][base1]
#   end

#   print base1
#   offset1 = val1 + 1
#   offset2 = val2 + 1
# end
