# As is the case with point mutations, the most common type of
# sequencing error occurs when a single nucleotide from a read is
# interpreted incorrectly.

# Given:
# A collection of up to 1000 reads of equal length (at most 50 bp) in
# FASTA format. Some of these reads were generated with a
# single-nucleotide error. For each read s in the dataset, one of the
# following applies:


# s was correctly sequenced and appears in the dataset at least twice
# (possibly as a reverse complement);

# s is incorrect, it appears in the dataset exactly once, and its
# Hamming distance is 1 with respect to exactly one correct read in
# the dataset (or its reverse complement).

# Return:
# A list of all corrections in the form "[old read]->[new
# read]". (Each correction must be a single symbol substitution, and
# you may return the corrections in any order.)

# Sample Dataset
# >Rosalind_52
# TCATC
# >Rosalind_44
# TTCAT
# >Rosalind_68
# TCATC
# >Rosalind_28
# TGAAA
# >Rosalind_95
# GAGGA
# >Rosalind_66
# TTTCA
# >Rosalind_33
# ATCAA
# >Rosalind_21
# TTGAT
# >Rosalind_18
# TTTCC

# Sample Output
# TTCAT->TTGAT
# GAGGA->GATGA
# TTTCC->TTTCA

require 'pp'
require '../fasta'

dnas = Fasta.new("corr.txt").read_dnas

correct_reads = []
corrections = []

puts dnas.length

dnas.each do |key, value|
  dnas.each do |k, v|
    next if k == key

    if value.str == v.str then
      correct_reads << key
    end

    if value.reverse_complement == v.str then
      correct_reads << key
    end
  end
end

correct_reads.uniq!

(dnas.keys - correct_reads).each do |key|
  value = dnas[key]

  correct_reads.each do |k|
    v = dnas[k]

    if value.hamming_distance(v) == 1 then
      corrections << [value.str, v.str]
      break
    elsif value.rev_complement_hamming_distance(v) == 1 then
      corrections << [value.str, v.reverse_complement]
      break
    end
  end
end

puts corrections.map { |a, b| "#{a}->#{b}"}
