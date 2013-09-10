require 'sinatra'

get '/' do
	erb :index
end

post '/thanks' do
	erb :thanks
end
