class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name #, :team_id
  belongs_to :team
  has_many :stats, :dependent => :delete_all

  def seasons
    stats.collect { |s| s.season }.uniq
  end

end
