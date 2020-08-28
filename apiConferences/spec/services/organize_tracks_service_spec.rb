require 'rails_helper'

RSpec.describe OrganizeTracksService do
  it "return a object with a order timesheet with schedules, description and minutes formatted" do

    fileFormat = ['Diminuindo tempo de execução de testes em aplicações Rails enterprise 60min',
                  'Reinventando a roda em ASP clássico 45min']

    orderTracksResult = OrganizeTracksService.new(fileFormat).assemble_timesheet

    expect(orderTracksResult).to eq(
      {
        :data => [
          {:schedule=>"09:00", :description => "Diminuindo tempo de execução de testes em aplicações Rails enterprise ", :minutes=>"60min", :track=>'A'},
          {:schedule=>"10:00", :description => "Reinventando a roda em ASP clássico ", :minutes=>"45min", :track=>'A'}
        ],
        :organize => true
      }
    )
  end

  it "return a erro hash message with error and a boolean false organize key value" do

    fileFormat = []
    orderTracksResult = OrganizeTracksService.new(fileFormat).assemble_timesheet

    expect(orderTracksResult).to eq({ error: "Erro ao Organizar Horários." , organize: false })
  end
end