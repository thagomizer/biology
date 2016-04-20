require '../dna'

File.open("gc.txt", 'r') do |f|
  id = ""
  dna_strings = {}
  f.each_line do |l|
    if l =~ />(Rosalind_\d+)/
      id = $1
    else
      dna_strings[id] ||= DNA.new
      dna_strings[id].str << l.chomp
    end
  end

  max = ['', 0]
  dna_strings.each do |name, obj|
    cg_content = obj.cg_content
    max = [name, cg_content] if cg_content > max[1]
  end

  puts max
end
