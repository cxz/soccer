class StatsController < ApplicationController

  def index
    by_player(params[:player_id])
  end

  def by_player(player_id)
    @player = Player.find(params[:player_id])
    @seasons = @player.seasons

    @years = [params[:season]] if params[:season]
    @years ||= Range.new(params[:seasonStart],params[:seasonEnd]).to_a if params[:seasonStart] && params[:seasonEnd]
    @years ||= @seasons.collect { |s| s.year }

    @totals = Stat.by_player_totals(@player.id, Season.find_all_by_year(@years))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @totals }
    end
  end



end
