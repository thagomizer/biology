# Problem

# A common substring of a collection of strings is a substring of
# every member of the collection. We say that a common substring is a
# longest common substring if there does not exist a longer common
# substring. For example, "CG" is a common substring of "ACGTACGT" and
# "AACCGGTATA", but it is not as long as possible; in this case, "GTA"
# is a longest commno substring of "ACGTACGT" and "AACCGTATA".

# Note that the longest common substring is not necessarily unique;
# for a simple example, "AA" and "CC" are both longest common
# substrings of "AACC" and "CCAA".


# Given: A collection of k (k<=100) DNA strings of length at most 1 kbp
# each in FASTA format.


# Return: A longest common substring of the collection. (If multiple
# solutions exist, you may return any single solution.)


# Example:

# >Rosalind_1
# GATTACA
# >Rosalind_2
# TAGACCA
# >Rosalind_3
# ATACA

# AC

require 'pp'
require '../fasta'

dnas = Fasta.new("lcsm.txt").read_dnas.values.map(&:str).sort_by(&:length)

s = dnas.shift.split('')
x
max_found = ""

# Generate all the substrings
1.upto(s.length) do |len|
  s.each_cons(len) do |cons|
    sub_string = cons.join
    max_found = sub_string if dnas.all? { |dna| dna.include?(sub_string) }
  end
end

puts max_found
