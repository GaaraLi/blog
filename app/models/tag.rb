class Tag < ActiveRecord::Base
	acts_as_paranoid
	has_many :articles
end
