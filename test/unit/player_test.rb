require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  def setup
    @season_1 = seasons(:season_1)
    @season_2 = seasons(:season_2)
    @season_3 = seasons(:season_3)
    @john = players(:john)
  end

  test "stats creation" do

    before = @john.stats.size
    @john.stats.create(:kind => 'gp', :value => '5', :season_id => @season_1.id)
    @john.stats.create(:kind => 'gs', :value => '0', :season_id => @season_1.id)
    @john.stats.create(:kind => 'gp', :value => '8', :season_id => @season_2.id)

    assert_equal(before + 3, @john.stats.size)
    assert_equal([@season_1, @season_2, @season_3], @john.seasons)

  end
end
