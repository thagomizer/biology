require '../dna'

lines = File.readlines("hamm.txt")
dna0 = DNA.from_str(lines[0])
dna1 = DNA.from_str(lines[1])

puts dna0.hamming_distance(dna1)

puts "TEST"
puts "Should be 7"
dna0 = DNA.from_str("GAGCCTACTAACGGGAT")
dna1 = DNA.from_str("CATCGTAATGACGGCCT")
puts dna0.hamming_distance(dna1)
