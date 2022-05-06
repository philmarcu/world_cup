require './lib/player'
require './lib/team'

RSpec.describe Team do
  let(:team) {Team.new("France")}
  let(:mbappe) {Player.new({name: "Kylian Mbappe", position: "forward"})}
  let(:pogba) {Player.new({name: "Paul Pogba", position: "midfielder"})}

  it 'exists & has attributes' do
    expect(team).to be_a(Team)
    expect(team.eliminated?).to eq(false)
    expect(team.players).to eq([])
  end

  it 'can eliminate teams' do
    team.eliminate_team
    expect(team.eliminated?).to eq(true)
  end

  it 'can add players to a team' do
    team.add_player(mbappe)
    team.add_player(pogba)
    expect(team.players).to eq([mbappe, pogba])
  end

  it 'can sort players_by_position' do
    team.add_player(mbappe)
    team.add_player(pogba)
    expect(team.players_by_position("midfielder")).to eq([pogba])
    expect(team.players_by_position("defender")).to eq([])
  end
end
