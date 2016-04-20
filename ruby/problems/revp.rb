# A DNA string is a reverse palindrome if it is equal to its reverse
# complement. For instance, GCATGC is a reverse palindrome because its
# reverse complement is GCATGC. See Figure 2.

# Given: A DNA string of length at most 1 kbp in FASTA format.

# Return: The position and length of every reverse palindrome in the
# string having length between 4 and 12. You may return these pairs in
# any order.

COMPLIMENTS = {"A" => "T", "T" => "A", "G" => "C", "C" => "G"}


def reverse_complement chars
  chars.map { |c| COMPLIMENTS[c] }.reverse
end

require '../fasta'
dna = Fasta.new("revp.txt").read_dnas.values.first.str.chars

results = []

(4..12).each do |l|
  (0...dna.length).each do |i|
    next if i + l > dna.length
    x = dna[i, l]
    if x == reverse_complement(x) then
      results << [i + 1, l]
    end
  end
end

puts results.sort_by{ |a, _| a }.map { |a, b| "#{a} #{b}" }
