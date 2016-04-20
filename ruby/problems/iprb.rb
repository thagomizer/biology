require 'pp'

# Given: Three positive integers k, m, and n, representing a
# population containing k+m+n organisms: k individuals are homozygous
# dominant for a factor, m are heterozygous, and n are homozygous
# recessive.

# Return: The probability that two randomly selected mating organisms
# will produce an individual possessing a dominant allele (and thus
# displaying the dominant phenotype). Assume that any two organisms
# can mate.

dominant, hetero, recessive = File.read("iprb.txt").chomp.split(' ').map(&:to_f)

# r_r = (recessive / total) * ((recessive - 1) / (total - 1))
# h_h = (hetero / total) * ((hetero - 1) / (total - 1))
# h_r = (hetero / total) * (recessive / (total - 1)) +
#   (recessive / total) * (hetero / (total - 1))

# recessive_total = r_r + h_h * 1/4 + h_r * 1/2
# puts 1 - recessive_total

def is_dominant? organism
  organism.include? "Y"
end

d_ary = Array.new(dominant) { ["Y", "Y"] }
h_ary = Array.new(hetero) { ["Y", "y"] }
r_ary = Array.new(recessive) { ["y", "y"] }

ary = d_ary + h_ary + r_ary

children = []

(0...ary.length).each do |i|
  (0...ary.length).each do |j|
    next if i == j
    p1 = ary[i]
    p2 = ary[j]
    children << [p1[0], p2[0]]
    children << [p1[0], p2[1]]
    children << [p1[1], p2[0]]
    children << [p1[1], p2[1]]
  end
end

d_children, r_children = children.partition { |o| is_dominant?(o) }

puts d_children.count.to_f / children.count
