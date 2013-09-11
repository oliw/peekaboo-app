require 'sinatra'
require 'pony'

Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}

get '/' do
	erb :index
end

get '/thanks' do
	erb :thanks
end

post '/thanks' do
  	Pony.mail :to => params[:email],
  			:from => 'no-reply@peekaboolabs.com',
  			:bcc => 'peekaboolabs@gmail.com',
            :subject => "Welcome to Peekaboo, #{params[:name]}!",
            :body => erb(:email, layout: false)
	erb :thanks
end

get '/howto' do
	erb :thanks
end
