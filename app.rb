require 'sinatra/base'

class PropertyManager < Sinatra::Base
    get '/' do
        "Properties"
    end

    run! if app_file == $0
end