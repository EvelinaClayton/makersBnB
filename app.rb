require 'sinatra/base'
require_relative './lib/listing'
require_relative './lib/user'

class PropertyManager < Sinatra::Base

    enable :sessions
    
    get '/' do
        erb :'index'
    end

    get '/properties' do
        @user = session[:username]
        # list all properties
        @listing = Listing.all
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
        Listing.create(params[:title], params[:city], params[:details], params[:price], params[:date_from], params[:date_till])
        redirect '/properties'
    end

    run! if app_file == $0

end
