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
			bit_code = (0..3).map { ('a'..'z').to_a[rand(50)] }.join	 
			@challenge = Challenge.new(:url=>  params[:search], :count => 1 , :bit_code => bit_code)
		end

		@challenge.save


	end

	def my_link
		
		@challenge = Challenge.find_by_bit_code(params[:search])

		redirect_to "http://#{@challenge.url}"

		# require 'nokogiri'
		# require 'open-uri'

		# @doc = Nokogiri::HTML(open("http://#{@challenge.url}"))

  end


end
