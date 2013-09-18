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
  			:from => 'no-reply@peekaboo-labs.com',
  			:bcc => 'peekaboolabs@gmail.com',
            :subject => "Welcome to Peekaboo, #{params[:name]}!",
            :body => erb(:emaildelay, layout: false)
	erb :thanks
end

get '/howto' do
	erb :thanks
end

get '/feedback' do
  if params[:who] != '123awdaikomaw'
    erb :index
  else
    erb :feedback
  end
end

post '/feedback' do
  Pony.mail :to => 'info@peekaboo-labs.com',
    :from => 'feedback-no-reply@peekaboo-labs.com',
        :subject => "Post-Report Feedback Received from #{params[:name]}!",
        :body => erb(:'feedback-email', layout: false)
  erb :feedbackThanks
end

get '/feedbackThanks' do
  erb :feedbackThanks
end