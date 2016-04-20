# Problem

# For DNA strings s1 and s2 having the same length, their
# transition/transversion ratio R(s1,s2) is the ratio of the total
# number of transitions to the total number of transversions, where
# symbol substitutions are inferred from mismatched corresponding
# symbols as when calculating Hamming distance (see "Counting Point
# Mutations").

# Given:
# Two DNA strings s1 and s2 of equal length (at most 1 kbp).

# Return: The transition/transversion ratio R(s1,s2).

# Sample Dataset

# >Rosalind_0209
# GCAACGCACAACGAAAACCCTTAGGGACTGGATTATTTCGTGATCGTTGTAGTTATTGGA
# AGTACGGGCATCAACCCAGTT
# >Rosalind_2200
# TTATCTGACAAAGAAAGCCGTCAACGGCTGGATAATTTCGCGATCGTGCTGGTTACTGGC
# GGTACGAGTGTTCCTTTGGGT

require '../fasta'

dnas = Fasta.new("tran.txt").read_dnas.values

transitions   = 0
transversions = 0

dnas[0].each_with_index do |base, i|
  other_base = dnas[1][i]
  next if base == other_base

  case base
  when 'A'
    if other_base == 'G'
      transitions += 1
    else
      transversions += 1
    end
  when 'G'
    if other_base == 'A'
      transitions += 1
    else
      transversions += 1
    end
  when 'C'
    if other_base == 'T'
      transitions += 1
    else
      transversions += 1
    end
  when 'T'
    if other_base == 'C'
      transitions += 1
    else
      transversions += 1
    end
  end
end

puts transitions.to_f/transversions
