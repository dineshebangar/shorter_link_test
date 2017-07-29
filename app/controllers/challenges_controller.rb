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
			@challenge = Challenge.new(:url=>  params[:search], :count => 1)
		end

		@challenge.save


	end


end
