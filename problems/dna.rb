require '../dna'

dna = DNA.from_file("dna.txt")
bases = dna.base_pair_hist
puts "#{bases['A']} #{bases['C']} #{bases['G']} #{bases['T']}"
