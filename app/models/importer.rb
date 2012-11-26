class Importer
  attr_reader :seasons, :team

  def initialize(xml_reader)
    @reader = xml_reader
  end

  def import

    return false if not @reader.seems_valid?

    Team.transaction do
      @team = Team.find_or_create_by_name @reader.get_team_name
      #always clear the team
      @team.players.destroy_all
      #print "team name=#{@team.name} id=#{@team.id}\n"

      @seasons = @reader.get_seasons
      @seasons.each do |s|

        season = Season.find_or_create_by_year s
        #print "season = #{season.year}, instance = #{season.id}\n"

        stats = @reader.get_players_stats_for_season season.year
        stats.each_pair do |p, ps|
          #check player by name in the team on last season (only)
          #if not, create a new one
          player = Player.find_or_create_by_team_id_and_first_name(@team.id, p)
          #print "player id=#{player.id} name=#{player.first_name} season id=#{season.id}\n"

          ps.each_pair do |kind, value|
            #print "stat = #{kind} #{value}"
            player.stats.create(:kind => kind, :value => value, :season_id => season.id)
          end
        end
        print "\n"
      end
    end #end transaction

  end
end