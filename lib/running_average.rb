# get a running average of the last (n) items
class RunningAverage
	def self.last_n_values(collection, number)
		raise ArgumentError, "number must be an integer greater than zero" unless number.class == Integer && number > 0
		collection = collection.select { |ele| ele.class == Integer }
		if number < collection.size
			collection.slice(-number .. -1).sum / number
		else
			collection.sum/collection.size
		end
	end
end