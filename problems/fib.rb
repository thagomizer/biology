n_mos, litter_size = File.read('fib.txt').chomp.split(' ').map(&:to_i)

results = [0, 1, 1]

(2..n_mos).each do |i|
  results[i] = results[i - 2] * litter_size + results[i - 1]
end

puts results[n_mos]
