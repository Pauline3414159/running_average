require 'minitest/autorun'
require_relative '../lib/running_average'

class RunningAverageTest < Minitest::Test
	def test_all_positive_numbers
		assert_equal(3, RunningAverage.last_n_values([2,2,3,3,3,3], 4))
	end
	
	def test_more_numbers_than_collection_size
		assert_equal(3, RunningAverage.last_n_values([3,3,3],5))
	end
	
	def test_what_about_zero
		assert_equal(0, RunningAverage.last_n_values([0,0,0,0], 3))
		assert_equal(0, RunningAverage.last_n_values([0,0],4))
		assert_raises(ArgumentError) {RunningAverage.last_n_values([2,3], 0)}
	end
	
	def test_what_about_non_integers_in_the_collection
		assert_equal(5, RunningAverage.last_n_values([4,5,5,5,'a'],3))
	end
end