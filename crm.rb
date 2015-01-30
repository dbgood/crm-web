require_relative 'rolodex'
require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
	include DataMapper::Resource

	property :id, Serial
	property :first_name, String
	property :last_name, String
	property :email, String
	property :note, String



# 	attr_accessor :id, :first_name, :last_name, :email, :note	

# def initialize(first_name, last_name, email, note)
# 		@id = id
# 		@first_name = first_name
# 		@last_name = last_name
# 		@email = email
# 		@note = note
# 		@contact.save
	end


DataMapper.finalize
DataMapper.auto_upgrade! #Will automatically fix anything in your code









# end of datamapper setup

# @@rolodex = Rolodex.new

# @@rolodex.add_contact(Contact.new("john", "smith", 'j@smith.com', 'like things'))
# @@rolodex.add_contact(Contact.new("jane", "smith", 'j@smith.com', 'like things'))
# @@rolodex.add_contact(Contact.new("josh", "smith", 'j@smith.com', 'like things'))
# @@rolodex.add_contact(Contact.new("jim", "smith", 'j@smith.com', 'like things'))
# @@rolodex.add_contact(Contact.new("jerry", "smith", 'j@smith.com', 'like things'))


get '/' do 
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
   @contacts = Contact.all
  erb :contacts
end

get '/contacts/new' do 
	@crm_app_name = "My CRM"
	erb :new
end

get '/contacts/:id' do
	id = params[:id].to_i
	@contact = @@rolodex.find(params[:id].to_i)

	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

get '/contacts/:id/edit' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end

delete "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @@rolodex.remove_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

	post '/contacts' do
		contact = Contact.create(
			:first_name => params[:first_name],
			:last_name => params[:last_name],
			:email => params[:email],
			:note => params[:note]
			)

			redirect to('/contacts')
		#@@rolodex.add_contact(new_contact)
		#erb :contacts
	end
