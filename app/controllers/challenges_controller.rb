class ChallengesController < ApplicationController

	def index
	end

	def dashboard
		@challenges = Challenge.all.order("count desc").limit(100)
	end	

	def short_url
		@challenge = Challenge.find_by_url( params[:search])
		if @challenge.present? 
			@challenge.count =  @challenge.count + 1
		else
			bit_code = (0..10).map { ('a'..'z').to_a[rand(50)] }.join	 
			@challenge = Challenge.new(:url=>  params[:search], :count => 1 , :bit_code => bit_code)
		end
		@challenge.save
	end

	def my_link
		redirect_to "http://#{Challenge.get_bit_code_url(params[:search])}"
  end

end
