n = File.read("perm.txt").chomp.to_i

ary = (1..n).to_a
puts ary.inject(1, :*)
ary.permutation.each do |perm|
  puts perm.join(' ')
end
