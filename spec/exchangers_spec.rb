require './command'

RSpec.describe Exchanger do
  before(:all) do
    @command = Command.new('ex_app_test')
    @command.upload_data
  end

  after(:all) do
    @command.close
  end

  it 'get amount of 19/12/2017' do
    value = @command.exchanger(100, '2017-12-19')
    expect(value).to eq(118.23)
  end

  it 'get amount of 20/12/2017' do
    value = @command.exchanger(100, '2017-12-20')
    expect(value).to eq(118.45)
  end

  it 'get amount of 03/12/2017' do
    value = @command.exchanger(100, '2017-12-03')
    expect(value).to eq(nil)
  end

  it 'get amount of 19/12/2017 and 20/12/2017 dates' do
    value = @command.exchanger(100, ['2017-12-19', '2017-12-20'])
    expect(value.first).to eq(118.23)
    expect(value.last).to eq(118.45)
  end
end
