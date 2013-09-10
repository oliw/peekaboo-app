require 'sinatra'
require 'pony'

Pony.options = { :from => 'info@peekaboo.com', 
				:via => :smtp, 
				:via_options => { :host => ENV['POSTMARK_SMTP_SERVER'], 
									:port => '25', 
									:enable_starttls_auto => true,
									:user_name => ENV['POSTMARK_API_KEY'],
									:domain => 'salty-headland-5059.heroku.com',
    								:password => ENV['POSTMARK_API_KEY'],
    								:authentication => :plain} }

get '/' do
	erb :index
end

post '/thanks' do
  	Pony.mail :to => params[:email],
            :subject => "Test, #{params[:name]}!",
            :body => erb(:email)
	erb :thanks
end
