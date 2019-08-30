require 'sinatra/base'
require_relative './lib/listing'
require_relative './lib/user'

class PropertyManager < Sinatra::Base

    enable :sessions
    
    get '/' do
        erb :'index'
    end

    get '/properties' do
        @user = session[:email]
        # list all properties
        @listing = Listing.all
        erb :"properties"
    end

    post '/user' do
        session[:email] = params[:email]
        session[:password] = params[:password]
        redirect '/properties'
    end

    get '/properties/list' do
        erb :"list"
    end

    get '/user/new' do
        erb :"/users/new"
    end

    post '/user/signup' do
        User.create(email: params[:email], password: params[:password])
        redirect '/properties'
    end

    post '/properties/list' do
        Listing.create(params[:title], params[:city], params[:details], params[:price], params[:date_from], params[:date_till])
        redirect '/properties'
    end

    run! if app_file == $0

end
