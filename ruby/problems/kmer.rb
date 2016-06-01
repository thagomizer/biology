# For a fixed positive integer k, order all possible k-mers taken from
# an underlying alphabet lexicographically.

# Then the k-mer composition of a string s can be represented by an array A
# for which A[m] denotes the number of times that the mth k-mer (with
# respect to the lexicographic order) appears in s.

# Given:
# A DNA string s in FASTA format (having length at most 100 kbp).

# Return:
# The 4-mer composition of s.

# Notes:
# For 2-mers in this string:
# TTGATTACCTTATTTGATCATTACACATTGTACGCTTGTGTCAAAATATCACATGTGCCT
# The values are
# AA AC AG AT CA CC CG CT GA GC GG GT TA TC TG TT
# 3  5  0  8  6  2  1  3  2  2  0  4  5  3  7  8


# Sample Dataset
# >Rosalind_6431
# CTTCGAAAGTTTGGGCCGAGTCTTACAGTCGGTCTTGAAGCAAAGTAACGAACTCCACGG
# CCCTGACTACCGAACCAGTTGTGAGTACTCAACTGGGTGAGAGTGCAGTCCCTATTGAGT
# TTCCGAGACTCACCGGGATTTTCGATCCAGCCTCAGTCCAGTCTTGTGGCCAACTCACCA
# AATGACGTTGGAATATCCCTGTCTAGCTCACGCAGTACTTAGTAAGAGGTCGCTGCAGCG
# GGGCAAGGAGATCGGAAAATGTGCTCTATATGCGACTAAAGCTCCTAACTTACACGTAGA
# CTTGCCCGTGTTAAAAACTCGGCTCACATGCTGTCTGCGGCTGGCTGTATACAGTATCTA
# CCTAATACCCTTCAGTTCGCCGCACAAAAGCTGGGAGTTACCGCGGAAATCACAG

# Sample Output
# 4 1 4 3 0 1 1 5 1 3 1 2 2 1 2 0 1 1 3 1 2 1 3 1 1 1 1 2 2 5 1 3 0 2
# 2 1 1 1 1 3 1 0 0 1 5 5 1 5 0 2 0 2 1 2 1 1 1 2 0 1 0 0 1 1 3 2 1 0
# 3 2 3 0 0 2 0 8 0 0 1 0 2 1 3 0 0 0 1 4 3 2 1 1 3 1 2 1 3 1 2 1 2 1
# 1 1 2 3 2 1 1 0 1 1 3 2 1 2 6 2 1 1 1 2 3 3 3 2 3 0 3 2 1 1 0 0 1 4
# 3 0 1 5 0 2 0 1 2 1 3 0 1 2 2 1 1 0 3 0 0 4 5 0 3 0 2 1 1 3 0 3 2 2
# 1 1 0 2 1 0 2 2 1 2 0 2 2 5 2 2 1 1 2 1 2 2 2 2 1 1 3 4 0 2 1 1 0 1
# 2 2 1 1 1 5 2 0 3 2 1 1 2 2 3 0 3 0 1 3 1 2 3 0 2 1 2 2 1 2 3 0 1 2
# 3 1 1 3 1 0 1 1 3 0 2 1 2 2 0 2 1 1

# Note: If your counts are off remember TTT is two overlapping instances of TT

require '../fasta'

dna = Fasta.new("kmer.txt").read_dnas.values.first.str.chars

bases = %W[A C G T]

# create all the 4mers
four_mers = bases.repeated_permutation(4).to_a.map(&:join).sort

# create a hash with the 4mers as keys and 0 as the value
counts = Hash[four_mers.zip(Array.new(four_mers.count).fill(0))]

# go through each size 4 chunk of the string and increment that 4mer's count
dna.each_cons(4) do |cons|
  counts[cons.join] += 1
end

# print out the counts
four_mers.each do |key|
  print "#{counts[key]} "
end
