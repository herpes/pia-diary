class Song < ActiveRecord::Base
  attr_accessible :composer_id, :key, :memo_id, :name, :opus
end
