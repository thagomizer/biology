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

AAAf, size = File.read("lexv.txt").split("\n")
alphabet = alphabet.split(" ")
size = size.to_i

results = []

size.times do |k|
  results += alphabet.repeated_permutation(k + 1).to_a
end

results.uniq

@lex_values = Hash[alphabet.zip((0...size).to_a)]

def lex_sorter x, y
  return (-1 * lex_sorter(y, x)) if y.length > x.length

  x.length.times do |i|
    c = @lex_values[x[i]] <=> @lex_values[y[i]]
    case c
    when 0
      next
    when nil
      return 1
    else
      return c
    end
  end

  return 0
end


puts results.sort { |x, y| lex_sorter(x, y) }.map(&:join)
