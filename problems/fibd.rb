require 'pp'

n_mos, $n_litters = File.read('fibd.txt').chomp.split(' ').map(&:to_i)

$results = {}

def fib n
  $results[n] ||= case
                  when n < 0
                    0
                  when n < 2
                    1
                  else
                    (2..$n_litters).map { |x| fib(n - x) }.inject(:+)
                  end
end

puts fib(n_mos)
