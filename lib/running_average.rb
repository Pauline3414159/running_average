# frozen_string_literal: true

require 'pry'
# frozen_string_literal: true

# get a running average of the last (n) items
class RunningAverage
  def self.last_n_values(collection, number)
    unless number.class == Integer && number.positive?
      raise ArgumentError, 'number must be an integer greater than zero'
    end

    collection = collection.select { |ele| ele.class == Integer }
    if number < collection.size
      collection.slice(-number..-1).sum / number
    else
      collection.sum / collection.size
    end
  end
end

# run the program
class Engine
  def initialize
    @collection = nil
    @num = nil
  end

  def use
    display_welcome
    user_collection
    clean_collection
    user_number
    display_answer
  end

  private

  def display_welcome
    puts 'Welcome to running average'
    puts 'Enter in your list of numbers seperated by spaces. Floats will be turned into integers'
  end

  def user_collection
    collection = nil
    ans = nil
    loop do
      collection = gets.chomp
      puts 'enter y to confirm your collection.'
      ans = gets.chomp
      break if ans.match?(/y/i)
    end
    @collection = collection.split(' ')
  end

  def clean_collection
    @collection.map! do |ele|
      if ele.match?(/\b-?[0-9]+\b/)
        ele.to_i
      else
        ele
      end
    end
    p @collection
    @collection
  end

  def user_number
    number = nil
    puts 'How long of a running average do you want?'
    loop do
      number = gets.chomp
      break if number.match?(/[1-9]/)

      puts 'enter a positive integer'
    end
    @num = number.to_i
  end

  def display_answer
    puts RunningAverage.last_n_values(@collection, @num)
  end
end

Engine.new.use
