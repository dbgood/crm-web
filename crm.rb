require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$rolodex = Rolodex.new

$rolodex.add_contact(Contact.new("john", "smith", 'j@smith.com', 'like things'))
$rolodex.add_contact(Contact.new("jane", "smith", 'j@smith.com', 'like things'))
$rolodex.add_contact(Contact.new("josh", "smith", 'j@smith.com', 'like things'))
$rolodex.add_contact(Contact.new("jim", "smith", 'j@smith.com', 'like things'))
$rolodex.add_contact(Contact.new("jerry", "smith", 'j@smith.com', 'like things'))


get '/' do 
	@crm_app_name = "My CRM"
	erb :index
end


get "/contacts" do
  @contacts = $rolodex.contacts

  erb :contacts
end

get '/contacts/new' do 
	@crm_app_name = "My CRM"
	erb :new
end


post '/contacts' do
	params[:note]
end