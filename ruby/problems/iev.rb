# Given: Six positive integers, each of which does not exceed
# 20,000. The integers correspond to the number of couples in a
# population possessing each genotype pairing for a given factor. In
# order, the six given integers represent the number of couples having
# the following genotypes:

# AA-AA
# AA-Aa
# AA-aa
# Aa-Aa
# Aa-aa
# aa-aa

# Return: The expected number of offspring displaying the dominant
# phenotype in the next generation, under the assumption that every
# couple has exactly two offspring.

## AA - AA => 100% chance of dominant phenotype
## AA - Aa => 100% chance of dominant phenotype
## AA - aa => 100% chance of dominant phenotype
## Aa - Aa =>  75% chance of dominant phenotype
## Aa - aa =>  50% chance of dominant phenotype
## aa - aa =>   0% chance of dominant phenotype

PROBS = [1.0, 1.0, 1.0, 0.75, 0.5, 0.0]

data = File.read("iev.txt").split(' ').map { |x| x.to_i }

expected = 0
data.zip(PROBS) { |x, y| expected += x * y }

puts expected * 2 # 2 for 2 offspring
