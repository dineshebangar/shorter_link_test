class Challenge < ApplicationRecord
	scope :get_bit_code_url, ->(bit_code) { find_by_bit_code(bit_code).url } # wrote scope to find url
end
