require "sinatra"
require "sinatra/json"
require 'sinatra/cross_origin'
require 'socket'

configure do
  enable :cross_origin
end

set :bind, '0.0.0.0'

get '/' do
  json hello: 'world'
end

get '/echo' do
  json current_time: "#{DateTime.now}",
        host: request.env["SERVER_NAME"],
        machine: Socket.gethostname
end
