# Problem

# For a collection of strings, a larger string containing every one of
# the smaller strings as a substring is called a superstring.

# By the assumption of parsimony, a shortest possible superstring over
# a collection of reads serves as a candidate chromosome.

# Given: At most 50 DNA strings whose length does not exceed 1 kbp in
# FASTA format (which represent reads deriving from the same strand of
# a single linear chromosome).

# The dataset is guaranteed to satisfy the following condition: there
# exists a unique way to reconstruct the entire chromosome from these
# reads by gluing together pairs of reads that overlap by more than
# half their length.

# Return: A shortest superstring containing all the given strings
# (thus corresponding to a reconstructed chromosome).

# Sample Dataset
# >Rosalind_56
# ATTAGACCTG
# >Rosalind_57
# CCTGCCGGAA
# >Rosalind_58
# AGACCTGCCG
# >Rosalind_59
# GCCGGAATAC

# Sample Output
# ATTAGACCTGCCGGAATAC

require 'pp'
require '../fasta'

dnas = Fasta.new("long.txt").read_dnas

dnas.each do |h, k|
  dnas[h] = dnas[h].str
end

candidates = []

names = dnas.keys
edges = []

names.permutation(2).each do |a, b|
  l = (dnas[a].length / 2)
  first  = dnas[a][0...l]
  second = dnas[a][l..-1]

  if dnas[b].include?(first) then
    edges << [b, a]
  elsif dnas[b].include?(second) then
    edges << [a, b]
  end
end

# Find something that only appears in the first position
firsts  = edges.map(&:first)
seconds = edges.map(&:last)

start = (firsts - seconds)[0]

edges_hash = Hash[edges]
order = [start]
current = start

loop do
  break unless edges_hash[current]
  order << edges_hash[current]
  edges_hash.delete(current)
  current = order.last
end

# Assembly
strs = order.map { |key| dnas[key] }

result = strs[0]

strs.each_cons(2) do |l, r|
  i = r.length
  while i >= 0 do
    if l.index(r[0...i]) then
      result += r[i..-1]
      break
    else
      i -= 1
    end
  end
end

puts result
