require 'pg'
require './scraper'
require './upload_data'
require './exchanger'

class Command
  def initialize(db)
    @con = PG.connect(dbname: db, port: 5432)
  end

  def upload_data
    csv_text = Scraper.call
    UploadData.call(@con, csv_text)
  end

  def exchanger(amount, dates)
    exchanger = Exchanger.new(@con)
    exchanger.exchange(amount, dates)
  end

  def close
    @con.close
  end
end
