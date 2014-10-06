class Article < ActiveRecord::Base
	acts_as_paranoid
	paginates_per 1

	# before_save :test1, :test2

	# private
	# def test1
	# 	puts '-------------'
	# 	puts 1
	# end

	# def test2
	# 	puts '=============='
	# 	puts 2
	# end
end
