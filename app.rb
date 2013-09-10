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

post '/thanks' do
  	Pony.mail :to => params[:email],
  			:from => 'info@peekaboo.com',
            :subject => "Test, #{params[:name]}!",
            :body => erb(:email)
	erb :thanks
end
