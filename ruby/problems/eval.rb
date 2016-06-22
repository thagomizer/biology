# coding: utf-8
# Problem

# Say that you place a number of bets on your favorite sports
# teams. If their chances of winning are 0.3, 0.8, and 0.6, then you
# should expect on average to win 0.3 + 0.8 + 0.6 = 1.7 of your bets
# (of course, you can never win exactly 1.7!)


# More generally, if we have a collection of events A1,A2,...,An, then
# the expected number of events occurring is Pr(A1)+Pr(A2)+...+Pr(An)
# (consult the note following the problem for a precise explanation of
# this fact). In this problem, we extend the idea of finding an
# expected number of events to finding the expected number of times
# that a given string occurs as a substring of a random string.


# Given:
# A positive integer n (n <= 1,000,000), a DNA string s of even length at most 10, and an array A of length at most 20, containing numbers between 0 and 1.

# Return:
# An array B having the same length as A in which B[i] represents the
# expected number of times that s will appear as a substring of a
# random DNA string t of length n, where t is formed with GC-content
# A[i] (see "Introduction to Random Strings").

# Sample Dataset
# 10
# AG
# 0.25 0.5 0.75

# Sample Output
# 0.422 0.563 0.422

## Setup
n, dna, ary = File.read("eval.txt").split("\n")

n   = n.to_i
ary = ary.split(" ").map(&:to_f)


ary.each do |gc_content|
  # Calculate the probability of a G, C, A, T individually
  prob_gc = gc_content / 2.0
  prob_at = (1 - gc_content) / 2

  # Calculate the probability of the specified DNA string
  result = 1.0
  dna.each_char do |c|
    case c
    when "G", "C"
      result *= prob_gc
    else
      result *= prob_at
    end
  end

  # Multiply by the number of dna.length sections in a string of size n
  # Think each_cons
  result *= (n - dna.length + 1)

  print "#{result.round(3)} "
end

puts
