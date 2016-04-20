# After identifying the exons and introns of an RNA string, we only
# need to delete the introns and concatenate the exons to form a new
# string ready for translation.

# Given: A DNA string s (of length at most 1 kbp) and a collection of
# substrings of s acting as introns. All strings are given in FASTA
# format.

# Return: A protein string resulting from transcribing and translating
# the exons of s. (Note: Only one solution will exist for the dataset
# provided.)

# Sample Dataset

# >Rosalind_10
# ATGGTCTACATAGCTGACAAACAGCACGTAGCAATCGGTCGAATCTCGAGAGGCATATGGTCACATGATCGGTCGAGCGTGTTTCAAAGTTTGCGCCTAG
# >Rosalind_12
# ATCGGTCGAA
# >Rosalind_15
# ATCGGTCGAGCGTGT
# Sample Output

# MVYIADKQHVASREAYGHMFKVCA

require '../fasta'
require '../protein'

data = Fasta.new("splc.txt").read_dnas.values
dna = data.first.str
introns = data[1..-1].map(&:str)

introns.each do |i|
  dna = dna.split(i).join
end

puts Protein.all_from_dna(dna).map(&:str).uniq.first

# MVIFAASERFCSMSSHDLHLNTKVLWRHSNMPTSQPRRPGQVRAAAATGGNTKRPCVSFIRASFQTDLELSNGSHFLSLRLYPVAPLSPPPLRVQSSLAGPYCDMVEGPSVLIAWFMHGFYNRGIRTGLSQLMVVSYNTNGALLQVYSLSIVRRTGITYTSVFDPQLVSLRDFHKCELTLGP
