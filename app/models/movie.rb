class Movie < ActiveRecord::Base
  has_many :checkins
end
