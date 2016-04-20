# Given: Two positive integers k (k<=7) and N (N<=2k). In this problem,
# we begin with Tom, who in the 0th generation has genotype Aa Bb. Tom
# has two children in the 1st generation, each of whom has two
# children, and so on. Each organism always mates with an organism
# having genotype Aa Bb.

# Return: The probability that at least N Aa Bb organisms will belong
# to the k-th generation of Tom's family tree (don't count the Aa Bb
# mates at each level). Assume that Mendel's second law holds for the
# factors.

# Sample Data
# 2 1

# Expected Output
# 0.684

require 'pp'

## Probability of AaBb in the first generation: 1/4
## Probability of AaBb in the second generation: is also 1/4 no matter
## what happened in the first generation

def factorial n
  return 1 if n < 2
  n.downto(2).inject(:*)
end

def nCk n, k
  factorial(n) / (factorial(k) * factorial(n - k))
end

k, n = File.read("lia.txt").chomp.split(' ').map(&:to_i)

organisms = 2**k
result = 0.0

(n..organisms).each do |i|
  t = nCk(organisms, i) * (0.25)**i * (0.75)**(organisms - i)
  result += t
end


pp result.round(3)
