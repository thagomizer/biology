# Given: A DNA string s of length at most 100 bp and an array A
# containing at most 20 numbers between 0 and 1.

# Return: An array B having the same length as A in which B[k]
# represents the common logarithm of the probability that a random
# string constructed with the GC-content found in A[k] will match s
# exactly.

# Sample Dataset

# ACGATACAA
# 0.129 0.287 0.423 0.476 0.641 0.742 0.783

# Sample Output

# -5.737 -5.217 -5.263 -5.360 -5.958 -6.628 -7.009

bases = %w[A T G C]

dna, probs = File.read("prob.txt").strip.split("\n")
probs = probs.split(' ').map(&:to_f)

counts = {}
bases.each do |x|
  counts[x] = dna.count(x)
end

results = []
probs.each do |p|
  r =  (p / 2) ** (counts["C"] + counts["G"])
  r *= ((1 - p) / 2) ** (counts["A"] + counts["T"])

  results << Math.log10(r).round(3)
end

puts results.join(' ')

# -68.922 -64.205 -55.98 -54.559 -52.627 -51.206 -51.124 -51.209 -52.47 -53.502 -55.233 -59.103 -62.034 -79.894
