require './lib/player'
require './lib/team'
require './lib/world_cup'

RSpec.describe WorldCup do
  let(:france) {Team.new("France")}
  let(:mbappe) {Player.new({name: "Kylian Mbappe", position: "forward"})}
  let(:pogba) {Player.new({name: "Paul Pogba", position: "midfielder"})}

  let(:croatia) {Team.new("Croatia")}
  let(:modric) {Player.new({name: "Luka Modric", position: "midfielder"})}
  let(:vida) {Player.new({name: "Domagoj Vida", position: "defender"})}

  let(:world_cup) {WorldCup.new(2018, [france, croatia])}

  it 'exists & has attributes' do
    expect(world_cup).to be_a(WorldCup)
    expect(world_cup.year).to eq(2018)
    expect(world_cup.teams).to eq([france, croatia])
  end

  it 'gives us active_players_by_position' do
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia.add_player(modric)
    croatia.add_player(vida)

    expect(world_cup.active_players_by_position("midfielder")).to eq([pogba, modric])
    croatia.eliminate_team

    expect(croatia.eliminated?).to eq(true)
    expect(world_cup.active_players_by_position("midfielder")).to eq([pogba])
  end

  it 'lists all_players_by_position' do
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia.add_player(modric)
    croatia.add_player(vida)

    expected = {
      "forward" => [mbappe],
      "midfielder" => [pogba, modric],
      "defender" => [vida]
    }
    expect(world_cup.all_players_by_position).to eq(expected)
  end
end
