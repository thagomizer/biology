# Given: A protein string of length at most 1000 aa.

# Return: The total number of different RNA strings from which the
# protein could have been translated, modulo 1,000,000. (Don't neglect
# the importance of the stop codon in protein translation.)

require '../protein'

protein = Protein.from_file("mrna.txt")

puts protein.possible_rna_count % 1_000_000
