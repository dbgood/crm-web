require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'
require 'sinatra/reloader'

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

get '/show-all' do
  @contacts = $rolodex.contacts

  erb :contacts
end

get '/contacts/new' do 
	@crm_app_name = "My CRM"
	erb :new
end

get '/contacts/:id' do
	id = params[:id].to_i
	@contact = @@rolodex.find(params)[:id].to_i

	if @contact
		erb :show_contact
	else
		raise Sinatra::Not Found
	end
end

get '/contacts/:id/edit' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::Not Found
	end
end

put "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end


post '/contacts' do
	params[:note]
end