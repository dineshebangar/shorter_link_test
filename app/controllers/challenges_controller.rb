class ChallengesController < ApplicationController

	# home page 

	def index
	end

	# dashboard is showing all shorten url list as per frequenty used url order

	def dashboard
		@challenges = Challenge.all.order("count desc").limit(100)
	end	

	# creating shorten url 

	def short_url
		@challenge = Challenge.find_by_url( params[:search])
		if @challenge.present? # checking url already present in database or not ?
			@challenge.count =  @challenge.count + 1 # adding url hit count
		else 
			bit_code = (0..10).map { ('a'..'z').to_a[rand(50)] }.join	 # creating bit code
			@challenge = Challenge.new(:url=>  params[:search], :count => 1 , :bit_code => bit_code)
		end
		@challenge.save # saving record
	end

	# redirecting url 

	def my_link 
		redirect_to "http://#{Challenge.get_bit_code_url(params[:search])}" # getting url by using bit code
  end

end
