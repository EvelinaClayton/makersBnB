require 'sinatra/base'


class PropertyManager < Sinatra::Base

    enable :sessions
    get '/' do
        erb :'index'
        
    end

    get '/properties' do
        @user = session[:username]
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
        redirect '/properties'
    end

    run! if app_file == $0

end
