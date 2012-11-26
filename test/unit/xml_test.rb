require 'test_helper'

class XmlTest < ActiveSupport::TestCase
  test "import" do
    xml = IO.read(Rails.root.join("test", "fixtures", "INDALL.xml"))
    reader = XmlReader.new
    reader.read xml
    xml_data = reader.get

    seasons = reader.get_seasons
    #print "#{seasons.size} seasons\n"
    assert_equal(2, seasons.size)

    assert_equal(22, reader.get_players_stats_for_season(2010).size)
    assert_equal(24, reader.get_players_stats_for_season(2011).size)

    #print "team name=#{reader.get_team_name}\n"
    #print "#{players.size} players\n"

  end

  test "stats have descriptions" do
    xml = IO.read(Rails.root.join("test", "fixtures", "INDALL.xml"))
    r = XmlReader.new
    r.read xml

    r.get_seasons.each { |s| r.get_players_stats_for_season(s).each_value { |stat|
        assert_equal([], stat.keys.find_all { |kind| not StatType::DESC.has_key? kind }, "all kinds should have descriptions")
      }
    }
  end
end
