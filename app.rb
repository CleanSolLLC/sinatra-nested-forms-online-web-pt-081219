require './environment'
require './app/models/pirate.rb'
require './app/models/ship.rb'
require 'pry'

module FormsLab
  class App < Sinatra::Base

  	get '/' do
      erb :root
	  end

    get '/new' do
      erb :new
	  end

	  post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
  
      params[:pirate][:ships].each do |details|
        #binding.pry
        Ship.new(details)
      end

      @ships = Ship.all

      erb :show
    end

  end
end
