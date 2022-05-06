class WorldCup

  attr_reader :year, :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    current_players = @teams.select do |team|
      team.eliminated? == false
    end
    players_pos = current_players.map {|team| team.players}.flatten
      players_pos.select {|player| player.position == position}
  end
end
