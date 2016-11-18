require 'httparty'
require 'json'

class MainController < ApplicationController
	include MainHelper, HTTParty
  def index
  	flash.now[:success] = 'Welcome!'
  end

  def show
  	id = params[:id]

  	response = HTTParty.get('https://itunes.apple.com/lookup?id=' + id + '&entity=song')

  	@single_track = JSON.parse(response.body)["results"]
  	@fav = Favorite.new
  end

  def search
  	artist = params[:artist]
  	# puts 'artist is ' + artist
  	artist = verify_input(artist)

  	response = HTTParty.get('https://itunes.apple.com/search?term=' + artist)

  	@http_party_json = JSON.parse(response.body)

  	@results = @http_party_json["results"]

  	if @results.length <= 0
  		flash.now[:danger] = 'You got no results. Try again.'
  	end
  end
end
