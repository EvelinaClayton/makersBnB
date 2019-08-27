require 'sinatra/base'

class PropertyManager < Sinatra::Base
    get '/' do
        "Properties"
    end

    get '/properties' do
        #display properties
        "2 Bedroom flat in Greenwich"
    end

    run! if app_file == $0
end