# Problem

# A signed permutation of length n is some ordering of the positive
# integers {1,2,...,n} in which each integer is then provided with
# either a positive or negative sign (for the sake of simplicity, we
# omit the positive sign). For example, pi = (5,-3,-2,1,4) is a signed
# permutation of length 5.

# Given: A positive integer n<=6.

# Return: The total number of signed permutations of length n,
# followed by a list of all such permutations (you may list the signed
# permutations in any order).

# Sample Dataset

# 2
# Sample Output

# 8
# -1 -2
# -1 2
# 1 -2
# 1 2
# -2 -1
# -2 1
# 2 -1
# 2 1

require 'pp'

n = File.read("sign.txt").strip.to_i

coeffs = (Array.new(n) { |_| 1 } + Array.new(n) { |_| -1 }).permutation(n).to_a

coeffs.uniq!

results = []
(1..n).to_a.permutation(n).each do |per|
  coeffs.each do |c|
    r = []
    per.zip(c) { |a, b| r << (a * b) }
    results << r
  end
end

puts results.length
puts results.map { |x| x.join(' ') }
