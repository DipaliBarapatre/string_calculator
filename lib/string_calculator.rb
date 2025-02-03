require 'pry'
class StringCalculator

	def self.add(numbers)

		#Return 0 if number is empty or nil
		return 0 if numbers.empty? || numbers.nil?
		return numbers if numbers.is_a?(Integer)

		#Find delimeters
		delimeter, numbers_list = get_delimeter(numbers)

		#Sum of numbers
		numbers.split(',').map(&:to_i).sum 
	end

	private

	def self.get_delimeter(numbers)
		if numbers.start_with?('//')
		   delimiter, numbers = numbers.split("\n", 2)
           delimiter = delimiter[2..-1]
           numbers = numbers.gsub(delimiter, ",")
        else
           delimiter = /,|\n|\s|;/
        end
        return delimiter, numbers
	end

end