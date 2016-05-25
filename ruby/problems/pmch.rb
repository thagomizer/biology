# Given an RNA string s = s1 ... sn, a bonding graph for s is formed
# as follows. First, assign each symbol of s to a node, and arrange
# these nodes in order around a circle, connecting them with edges
# called adjacency edges. Second, form all possible edges {A, U} and
# {C, G}, called basepair edges; we will represent basepair edges with
# dashed edges, as illustrated by the bonding graph in Figure 4.

# Note that a matching contained in the basepair edges will represent
# one possibility for base pairing interactions in s, as shown in
# Figure 5. For such a matching to exist, s must have the same number
# of occurrences of 'A' as 'U' and the same number of occurrences of
# 'C' as 'G'.


# Given:
# An RNA string s of length at most 80 bp having the same number of
# occurrences of 'A' as 'U' and the same number of occurrences of 'C'
# as 'G'.

# Return:
# The total possible number of perfect matchings of basepair edges in
# the bonding graph of s

# Sample:
# Sample Dataset
#   >Rosalind_23
#   AGCUAGUCAU

# Sample Output:
# 12

require 'pp'
require '../fasta'

def factorial n
  (2..n).inject(&:*)
end

dna = Fasta.new("pmch.txt").read_dnas.values.first.str

nodes = dna.split("")

groups = nodes.group_by { |i| i }
groups = Hash[groups.map { |k, v| [k, v.length] }]

pp groups

au_count = factorial groups["A"]
gc_count = factorial groups["G"]

puts au_count
puts gc_count

puts au_count * gc_count
