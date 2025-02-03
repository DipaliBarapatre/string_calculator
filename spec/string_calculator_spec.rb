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

		it "should add numbers between new lines" do
			expect(StringCalculator.add("1\n2,3")).to eq(6)
		end

		it 'should handle space between numbers' do
			expect(StringCalculator.add("1 2 3")).to eq(6)
		end

		it 'should not return wrong value' do
			expect(StringCalculator.add("1, 3, 4")).not_to eq(10)
		end

		it 'should support different delimiters' do
			expect(StringCalculator.add("//;\n1;2")).to eq(3)
		end

		it "should raise exception for negative number" do
			expect{StringCalculator.add("-1")}.to raise_error('Negative numbers not allowed: -1')
			expect{StringCalculator.add("1, -2")}.to raise_error('Negative numbers not allowed: -2')
		end

		it 'should raise exception for multiple negative numbers' do
			expect{StringCalculator.add("-1, 3, -4")}.to raise_error('Negative numbers not allowed: -1, -4')
        end

	end
end