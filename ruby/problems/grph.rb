# For a collection of strings and a positive integer k, the overlap
# graph for the strings is a directed graph Ok in which each string is
# represented by a node, and string s is connected to string t with a
# directed edge when there is a length k suffix of s that matches a
# length k prefix of t, as long as s != t; we demand s != t to prevent
# directed loops in the overlap graph (although directed cycles may be
# present).

# Given: A collection of DNA strings in FASTA format having total
# length at most 10 kbp.

# Return: The adjacency list corresponding to O3. You may return edges
# in any order.

# Example

# Given:
#  >Rosalind_0498
#  AAATAAA
#  >Rosalind_2391
#  AAATTTT
#  >Rosalind_2323
#  TTTTCCC
#  >Rosalind_0442
#  AAATCCC
#  >Rosalind_5013
#  GGGTGGG

# Print:
#  Rosalind_0498 Rosalind_2391
#  Rosalind_0498 Rosalind_0442
#  Rosalind_2391 Rosalind_2323

require '../fasta'
require 'pp'

dnas = Fasta.new("grph.txt").read_dnas
edges = []
checked = []


dnas.each do |name, dna|
  checked << dna
  str = dna.str
  prefix = str[0..2]
  suffix = str[-3..-1]

  dnas.each do |n, d|
    next if checked.include?(d)
    p = d.str[0..2]
    s = d.str[-3..-1]

    edges << "#{n} #{name}" if s == prefix
    edges << "#{name} #{n}" if suffix == p
  end
end

puts edges
