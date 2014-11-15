class NucleicAcid
  def self.complement(na)
    case na
    when "A"
      "T"
    when "T"
      "A"
    when "C"
      "G"
    when "G"
      "C"
    end
  end
end
