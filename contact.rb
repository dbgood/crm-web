class Contact

	attr_accessor :id, :first_name, :last_name, :email, :note

	def initialize(first_name, last_name, email, note)
		@id = id
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note
	end

	def to_s
		#return a nicely formatted string for printing
		"[#{id}] #{first_name} #{last_name} (#{email}) -- Note: #{note}"
	end

end