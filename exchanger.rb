require './parsable_date'

class Exchanger
  def initialize(con)
    @con = con
  end

  def exchange(amount, dates)
    dates = Array(dates)

    values = dates.map do |date|
      if ParsableDate.call(date)
        "'#{date}'"
      else
        raise(ArgumentError, "Invalid dates")
      end
    end

    rs = @con.exec(
      "select DISTINCT ex_date, amount from exchangers where ex_date in (#{values.join(',')}) ORDER BY ex_date ASC"
    )

    numbers = []
    rs.each do |row|
      numbers << (amount * row["amount"].to_f).round(2)
    end

    if numbers.size > 1
      numbers
    else
      numbers.first
    end
  rescue ArgumentError => e
    p e
  end
end
