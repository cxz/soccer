class Season < ActiveRecord::Base
  attr_accessible :year
  has_many :stats, :dependent => :delete_all
end
