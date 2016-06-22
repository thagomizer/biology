# Problem

# Say that we have strings s=s1 s2...sm and t=t1 t2...tn with m <
# n. Consider the substring t'=t[1:m]. We have two cases:

# If s=t', then we set s<Lex t because s is shorter than t (e.g., APPLE
# < APPLET). Otherwise, s =/= t'. We define s <Lex t if s <Lex t' and define
# s >Lex t if s>Lex t' (e.g., APPLET <Lex ARTS  because APPL <Lex ARTS).

# Given: A permutation of at most 12 symbols defining an ordered
#  alphabet A and a positive integer n (n <= 4).

# Return: All strings of length at most n
# n formed from A, ordered lexicographically. (Note: As in
# "Enumerating k-mers Lexicographically", alphabet order is based on
# the order in which the symbols are given.)

# Sample Dataset
# D N A
# 3

# Sample Output
# D
# DD
# DDD
# DDN
# DDA
# DN
# DND
# DNN
# DNA
# DA
# DAD
# DAN
# DAA
# N
# ND
# NDD
# NDN
# NDA
# NN
# NND
# NNN
# NNA
# NA
# NAD
# NAN
# NAA
# A
# AD
# ADD
# ADN
# ADA
# AN
# AND
# ANN
# ANA
# AA
# AAD
# AAN

require 'pp'

alphabet, size = File.read("lexv.txt").split("\n")
size           = size.to_i
alphabet       = alphabet.split(" ")
$ordering       = Hash[alphabet.zip(0..(alphabet.size))]
$ordering[nil]  = -1

def lexo x, y
  max = [x.length, y.length].max
  (0..max).each do |i|
    case
    when x[i] == y[i]
      next
    when $ordering[x[i]] > $ordering[y[i]]
      return 1
    when $ordering[x[i]] < $ordering[y[i]]
      return -1
    end
  end
  0
end

results = []

(1..size).each do |n|
  results += alphabet.repeated_permutation(n).to_a
end

results = results.sort { |x, y| lexo(x, y) }

puts results.map(&:join)
