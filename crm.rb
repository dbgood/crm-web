require 'sinatra'

get '/' do 
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do 
	@crm_app_name = "My CRM"
	erb :contacts
end

get '/contacts/new' do 
	@crm_app_name = "My CRM"
	erb :new
end