require 'sinatra/base'
require_relative './lib/listing'

class PropertyManager < Sinatra::Base

    enable :sessions
    get '/' do
        erb :'index'

    end


    get '/properties' do
        @user = session[:username]
        # list all properties
        @listing = Listing.all
        p @listing
        erb :"properties"
    end

    post '/user' do
        session[:username] = params[:username]
        redirect '/properties'
    end

    get '/properties/list' do
        erb :"list"
    end

   post '/properties/list' do
        Listing.create(title: params[:title], city: params[:city])
        redirect '/properties'
    end

    run! if app_file == $0

end
