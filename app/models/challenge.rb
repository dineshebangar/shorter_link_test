class Challenge < ApplicationRecord
	scope :get_bit_code_url, ->(bit_code) { find_by_bit_code(bit_code).url } # wrote scope to find url

	def self.get_bit_code
		bit_code = (0..10).map { ('a'..'z').to_a[rand(50)] }.join

		# creating bit code till bit code is not present database

		until !Challenge.bit_code_present(bit_code)  do
			bit_code = (0..10).map { ('a'..'z').to_a[rand(50)] }.join
		end

		return bit_code	
	end

	# checking bit_code present in database or not
	def self.bit_code_present(bit_code) 
		if(Challenge.get_bit_code_url(bit_code) rescue false)
			return true
		else
			return false
		end		
	end	
end
