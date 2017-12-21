class ParsableDate
  def self.call(string)
    Date.parse(string)
    true
  rescue ArgumentError
    false
  end
end
