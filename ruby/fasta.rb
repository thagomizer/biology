require_relative 'dna'

class Fasta
  attr_accessor :dnas

  def initialize filename
    @filename = filename
    @dnas = {}
  end

  def read_dnas
    File.open(@filename) do |f|
      dna = DNA.new
      name = ""
      f.each_line do |l|
        if l =~ /^>(.*)/ then
          @dnas[name] = dna unless dna.str.empty?
          dna = DNA.new
          name = $1
          next
        else
          dna.str << l.strip
        end
      end
      @dnas[name] = dna unless dna.str.empty?
    end
    @dnas
  end

end
