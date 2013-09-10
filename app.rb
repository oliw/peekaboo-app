require 'sinatra'
require 'pony'

get '/' do
	erb :index
end

post '/thanks' do
  	Pony.mail :to => params[:email],
            :from => "info@peekaboo.com",
            :subject => "Test, #{params[:name]}!",
            :body => erb(:email)
	erb :thanks
end
