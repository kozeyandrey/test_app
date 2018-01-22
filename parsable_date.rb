class ParsableDate
  def self.call(string)
    if Date.parse(string)
      true
    end
  rescue ArgumentError => e
    p e
    false
  end
end
