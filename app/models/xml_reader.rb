class XmlReader

  #name assinged to teams without name
  UNNAMED = :unnamed

  def initialize(xml_data)
    @xml_doc = read(xml_data)
  end

  def seems_valid?
    @xml_doc.search('//soseasons//soseas//team').size > 0
  end

  def get_seasons
    teams = @xml_doc.search('//team')
    teams.collect{|t| t['season']}.uniq
  end

  def get_team_name
    names = @xml_doc.search('//team')
    names = names.collect{|n| n['name'] || n['code'] }.uniq
    #check if teams have different names
    if names.size > 1
      #more than one team in the file
    end
    names.find {|n| not n.blank? } || UNNAMED

  end

  def get_players_stats_for_season year
    players_stats = Hash.new
    players = @xml_doc.search("//team[@season='#{year}']//player")
    players.each do |p|
      name = p['checkname']
      stats = Hash.new
      stats[:general_gp] = p['gp']
      stats[:general_gs] = p['gs']
      p.element_children.each do |s|
      #[:shots, :goaltype, :cautions, :misc]
        s.keys.each{ |k| stats[:"#{s.name}_#{k}"] = s[k]}
      end
      players_stats[name] = stats
    end
    return players_stats
  end

  protected

  def read (data)
    @xml_doc  = Nokogiri::XML(data)
  end
end
