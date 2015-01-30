class Rolodex 
	attr_reader :contacts          # Rolodex is to store and display
	
	@@ids = 1001

	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@ids
		@contacts << contact
		@@ids +=1
	end

	def remove_contact(contact)
		@contacts.delete(contact)
	end


	def find(id)
		@contacts.find { |contact| contact.id == id }
	end


	
end