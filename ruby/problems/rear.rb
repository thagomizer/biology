# Problem

# A reversal of a permutation creates a new permutation by inverting
# some interval of the permutation; (5,2,3,1,4), (5,3,4,1,2), and
# (4,1,2,3,5) are all reversals of (5,3,2,1,4). The reversal distance
# between two permutations pi and sigma, written drev(pi, sigma), is
# the minimum number of reversals required to transform pi into sigma
# (this assumes that pi and sigma have the same length).

# Given:
# A collection of at most 5 pairs of permutations, all of which have length 10.

# Return:
# The reversal distance between each permutation pair.

# Sample Dataset

# 1 2 3 4 5 6 7 8 9 10
# 3 1 5 2 7 4 9 6 10 8

# 3 10 8 2 5 4 7 1 6 9
# 5 2 3 1 7 4 10 8 6 9

# 8 6 7 9 4 1 3 10 2 5
# 8 2 7 6 9 1 5 3 10 4

# 3 9 10 4 1 8 6 7 5 2
# 2 9 8 5 1 7 3 4 6 10

# 1 2 3 4 5 6 7 8 9 10
# 1 2 3 4 5 6 7 8 9 10

# Sample Output

# 9 4 5 7 0

require 'pp'
require 'pry'

def partition_by_breakpoints s
  results = []
  temp = []
  s.each_cons(2) do |a, b|
    temp << a
    unless (a - b).abs == 1 then
      results << temp
      temp = []
    end
  end
  temp << s.last
  results << temp
end


seqs = File.read("rear.txt").strip.split("\n").reject{ |s| s.empty? }

s = seqs[0].split(' ').map(&:to_i)
e = seqs[1].split(' ').map(&:to_i)

## Prep
##   Take second array and map each element to its index if the first
##   array. Then we can compare it to (1...n)
e.map! { |x| s.index(x)}

EXPECTED = (0...10).to_a

pp e
pp partition_by_breakpoints(e)
partition = partition_by_breakpoints e

count = 0


until partition.length == 1 do
  count += 1
  found = false

  # Rule A
  partition.each_with_index do |hunk, i|
    t = partition.dup
    t[i] = hunk.reverse
    t = partition_by_breakpoints(t.flatten)
    if partition.length > t.length
      puts "Rule A"
      found = true
      pp t
      partition = t
      break
    end
  end
  next if found

  # Rule B
  (2..partition.length).each do |len|
    break if found
    (0..partition.length).each do |i|
      t = partition.dup
      hunk = t.slice!(i, len).flatten.reverse
      t.insert(i, hunk)
      t = partition_by_breakpoints(t.flatten)

      if partition.length > t.length
        puts "Rule B"
        found = true
        pp t
        partition = t
        break
      end
    end
  end
  next if found

  # Rule C
  max_index = 0
  max = 0
  partition.each_with_index do |hunk, i|
    if hunk.length > max
      max = hunk.length
      max_index += i
    end
  end

  t = partition.dup
  t[max_index] = t[max_index].reverse
  t = partition_by_breakpoints(t.flatten)
  puts "Rule C"
  pp t
  partition = t
end

puts count

## Partition by breakpoints
##   A) Try reversing each hunk and re-partition. If # breakpoints
##   decreases, increase count and start alg with new array
##
##   B) Try 2+ hunks together and re-partition. If # breakpoints
##   decreases, increase count and start alg wih new array
##
##   C) Try reversing longest hunk and re-partition, increase count
##   but number of breakpoints won't decrease.
