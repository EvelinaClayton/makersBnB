require 'sinatra/base'


class PropertyManager < Sinatra::Base
   
    enable :sessions

    get '/' do
        erb :'index'
    end

    get '/properties' do
        "hello There #{session[:username]}"
        
    end

    get '/add' do
        "Add listing"
    end

    post '/user' do
        session[:username] = params[:username]
        redirect '/properties'
    end

    run! if app_file == $0

end   
