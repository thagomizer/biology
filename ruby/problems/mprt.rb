# To allow for the presence of its varying forms, a protein motif is
# represented by a shorthand as follows: [XY] means "either X or Y"
# and {X} means "any amino acid except X." For example, the
# N-glycosylation motif is written as N{P}[ST]{P}.

# You can see the complete description and features of a particular
# protein by its access ID "uniprot_id" in the UniProt database, by
# inserting the ID number into
#   http://www.uniprot.org/uniprot/uniprot_id
# Alternatively, you can obtain a protein sequence in FASTA format by following
#   http://www.uniprot.org/uniprot/uniprot_id.fasta
# For example, the data for protein B5ZC00 can be found at
#   http://www.uniprot.org/uniprot/B5ZC00.

# Given:
# At most 15 UniProt Protein Database access IDs.

# Return:
# For each protein possessing the N-glycosylation motif, output its
# given access ID followed by a list of locations in the protein
# string where the motif can be found.

# Example

# Given
#    A2Z669
#    B5ZC00
#    P07204_TRBM_HUMAN
#    P20840_SAG1_YEAST

# Return
#    B5ZC00
#    85 118 142 306 395
#    P07204_TRBM_HUMAN
#    47 115 116 382 409
#    P20840_SAG1_YEAST
#    79 109 135 248 306 348 364 402 485 501 614

require 'open-uri'

NGLYCO = /N[^P][ST][^P]/


ids = File.readlines("mprt.txt").map { |l| l.strip }

name = ""
data = {}
results = Hash.new { |h, k| h[k] = [] }

ids.each do |id|
  open("http://www.uniprot.org/uniprot/#{id}.fasta") do |f|
    f.each_line do |l|
      if l =~ /^>(.*)/ then
        name = id
        data[name] = ""
      else
        data[name] << l.strip
      end
    end
  end
end


data.each do |id, str|
  i = 0
  while i do
    i = str.index(NGLYCO, i)
    break unless i
    i += 1
    results[id] << i
  end
end

results.each do |k, v|
  puts k
  puts v.join(' ')
end
