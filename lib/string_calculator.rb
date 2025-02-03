require 'pry'
class StringCalculator

	def self.add(numbers)

		#Return 0 if number is empty or nil
		return 0 if numbers.empty? || numbers.nil?
		return numbers if numbers.is_a?(Integer)

		#Find delimeters
		delimeter, numbers_list = get_delimeter(numbers)

		#Replace new lines with commas
		numbers = numbers_list.gsub("\n", ",")

		numbers = numbers_list.split(",").map(&:to_i)

		#Check negative numbers
		negative_numbers = numbers.select { |num| num < 0 }
        raise "Negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?

		#Sum of numbers
		numbers.sum 
	end

	private

	def self.get_delimeter(numbers)
		if numbers.start_with?('//')
		   delimiter, numbers = numbers.split("\n", 2)
           delimiter = delimiter[2..-1]
           numbers = numbers.gsub(delimiter, ",")
        end
        return delimiter, numbers
	end

end