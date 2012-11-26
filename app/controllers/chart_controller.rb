class ChartController < ApplicationController

  def index
    player = Player.find(params[:player_id])
    years = Range.new(params[:seasonStart],params[:seasonEnd]).to_a if params[:seasonStart] && params[:seasonEnd]

    @totals = [Stat.by_player_totals(player.id, Season.find_all_by_year(years)) , Stat.by_player_totals(player.id, Season.find_all_by_year(years))]

    respond_to do |format|
      #format.html # index.html.erb
      format.json { render json: @result }
    end
  end
end
