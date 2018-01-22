class ParsableDate
  def self.call(string)
    if Date.parse(string)
          true
    else
      false
    end
  rescue ArgumentError
    false
  end
end
