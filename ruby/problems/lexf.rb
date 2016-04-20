# Assume that an alphabet A has a predetermined order; that is, we
# write the alphabet as a permutation A =(a1,a2,...,ak), where
# a1<a2<...<ak. For instance, the English alphabet is organized as
# (A,B,...,Z).

# Given two strings s and t having the same length n, we say that s
# precedes t in the lexicographic order (and write s<Lex t) if the
# first symbol s[j] that doesn't match t[j]in A.

# Given: A collection of at most 10 symbols defining an ordered
# alphabet, and a positive integer n (n <= 10)

# Return: All strings of length n that can be formed from the
# alphabet, ordered lexicographically.

# Sample Dataset
# T A G C
# 2

# Sample Output
# TT
# TA
# TG
# TC
# AT
# AA
# AG
# AC
# GT
# GA
# GG
# GC
# CT
# CA
# CG
# CC

alphabet, size = File.read("lexf.txt").split("\n")

alphabet = alphabet.split(" ")
size = size.to_i

puts alphabet.repeated_permutation(size).to_a.map(&:join)
