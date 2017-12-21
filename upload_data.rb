require './parsable_date'

class UploadData
  def self.call(con, csv_text)
    values = []
    CSV.parse(csv_text, headers: true) do |data|
      if ParsableDate.call(data[0].to_s) && data[1].to_f != 0.0
        values << "('#{data[0]}',#{data[1]})"
      end
    end

    con.exec(
      "insert into exchangers (ex_date, amount) values#{values.join(',')}"
    )
  rescue PG::Error => e
    puts e.message
  end
end
