# Problem

# A subsequence of a permutation is a collection of elements of the
# permutation in the order that they appear. For example, (5, 3, 4) is
# a subsequence of (5, 1, 3, 4, 2).

# A subsequence is increasing if the elements of the subsequence
# increase, and decreasing if the elements decrease. For example,
# given the permutation (8, 2, 1, 6, 5, 7, 4, 3, 9), an increasing
# subsequence is (2, 6, 7, 9), and a decreasing subsequence is (8, 6,
# 5, 4, 3). You may verify that these two subsequences are as long as
# possible.

# Given: A positive integer n <= 10_000 followed by a permutation p of length n.

# Return: A longest increasing subsequence of p, followed by a longest
# decreasing subsequence of p.

# Sample Dataset

# 5
# 5 1 4 2 3
# Sample Output

# 1 2 3
# 5 4 2

require 'pp'

Struct.new("Entry", :asc_len, :asc_data, :dsc_len, :dsc_data)

n, arr = File.read("lgis.txt").strip.split("\n")

n = n.to_i
arr = arr.split(" ").map(&:to_i)

results = Hash.new { |h, k| results[k] = Struct::Entry.new(0, [], 0, []) }

max_asc = results[0]
max_dsc = results[0]

arr.each_with_index do |curr, i|
  if i == 0 then
    results[i].asc_len = 1
    results[i].asc_data = [curr]
    results[i].dsc_len = 1
    results[i].dsc_data = [curr]
  else
    # Compare curr to the last entry in each previous
    best_asc_len = 0
    best_asc_data = []
    best_dsc_len = 0
    best_dsc_data = []

    (0...i).each do |r_i|
      cache_entry = results[r_i]

      if curr > cache_entry.asc_data.last then
        if cache_entry.asc_len > best_asc_len then
          best_asc_len = cache_entry.asc_len
          best_asc_data = cache_entry.asc_data
        end
      end

      if curr < cache_entry.dsc_data.last then
        if cache_entry.dsc_len > best_dsc_len then
          best_dsc_len = cache_entry.dsc_len
          best_dsc_data = cache_entry.dsc_data
        end
      end
    end

    results[i].asc_len = best_asc_len + 1
    results[i].asc_data = best_asc_data + [curr]
    results[i].dsc_len = best_dsc_len + 1
    results[i].dsc_data = best_dsc_data + [curr]

    max_asc = results[i] if results[i].asc_len > max_asc.asc_len
    max_dsc = results[i] if results[i].dsc_len > max_dsc.dsc_len

  end
end

puts max_asc.asc_data.join(" ")
puts max_dsc.dsc_data.join(" ")
