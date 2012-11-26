require 'test_helper'

class StatTest < ActiveSupport::TestCase

  def setup
    @season_1 = seasons(:season_1)
    @season_2 = seasons(:season_2)
    @season_3 = seasons(:season_3)
    @john = players(:john)
    #pp Stat.all
  end

  test "by_player" do
    assert_equal(2, Stat.by_player(@john.id, [@season_1.id, @season_2.id]).size)
    assert_equal(1, Stat.by_player(@john.id, [@season_1.id]).size)
  end

  test "by_player_totals" do
    #sanity check: only one season
    r = Stat.by_player_totals(@john.id, [@season_1.id])
    assert_equal([['gp', 5]], r.collect {|s| [s.kind, s.value]})

    #collected over 3 seasons
    r = Stat.by_player_totals(@john.id, [@season_1.id, @season_2.id, @season_3.id])
    assert_equal([['gp', 20], ['gs', 1]], r.collect { |s| [s.kind, s.value]} )

  end

  test "description" do
    s = Stat.new(:kind => :general_gp)
    assert_equal('Games played', s.description)
  end

end
