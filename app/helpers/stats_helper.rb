module StatsHelper
  def current_url(new_params)
    url_for :params => params.dup.merge(new_params)
  end

end
