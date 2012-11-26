class Stat < ActiveRecord::Base
  attr_accessible :kind, :value, :season_id
  belongs_to :player
  belongs_to :season

  #def self.shots_by_season(player_id)
  #  @shots_by_season = Stat.where(:player_id => player_id).select{ |s| s.kind.starts_with?('shots_') }.group_by{ |s| s.season.year }
  #  @result = []
  #  @shots_by_season.each do |year, stats|
  #    row = {}
  #    row[:season] = year
  #    stats.each { |s| row[s.kind] = s.value }
  #    #print "#{stats}\n"
  #    @result << row
  #  end
  #  @result
  #end

  def self.by_player(player_id, season_ids)
    Stat
      .where(:player_id => player_id, :season_id => season_ids)
  end

  def self.by_player_totals(player_id, season_ids)
    Stat
      .select("kind, sum(value) as value")
      .where(:player_id => player_id, :season_id => season_ids)
      .group(:kind)
  end

  def description

    StatType::DESC[kind.to_sym]
  end

end
