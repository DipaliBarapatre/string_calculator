require 'rspec'
require_relative '../lib/string_calculator.rb'

RSpec.describe StringCalculator do
	describe '#Add' do
		it "take empty string and return 0 output" do
			expect(StringCalculator.add("")).to eq(0)
	    end

	    it 'take one numbers and return output' do
	    	expect(StringCalculator.add("1")).to eq(1)
	    end

	    it 'take two numbers and return output' do
	    	expect(StringCalculator.add("1,5")).to eq(6)
	    end

		it 'add multiple numbers' do
			expect(StringCalculator.add("1, 3, 4")).to eq(8)
		end

	end
end