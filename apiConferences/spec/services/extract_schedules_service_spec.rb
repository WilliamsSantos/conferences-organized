require 'rails_helper'

RSpec.describe ExtractSchedulesService do
  it "return a array with descriptions and minutes" do
    result = ExtractSchedulesService.new([
        'descricao 30min',
        'descricao1 60 min',
    ]).extract

    expect([{ description: 'descricao', minutes: '30min'}, { description: 'descricao1', minutes: '60min'}])
  end

  it "return a array with descriptions and minutes" do
    result = ExtractSchedulesService.new([333]).extract

    expect(result).to_not be_valid
  end
end