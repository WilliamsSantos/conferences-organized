require 'rails_helper'

RSpec.describe FileFormatService do
  it "return the rows from archive in a array of string" do
    finalResult = ["Diminuindo tempo de execução de testes em aplicações Rails enterprise 60min\\", 
                  "Reinventando a roda em ASP clássico 45min\\"]

    file = nil

    File.open("#{Rails.root}/tmp/proposals.txt", 'r') do |fileb|
        file = fileb.first
    end

    fileFormat = FileFormatService.new({fileFormat: file}).format

    expect(fileFormat).to eq(finalResult)
  end
end