class UserSession < Authlogic::Session::Base

	def to_key
		[session_key]
		#new_record? ? nil : [ self.send(self.class.primary_key) ]
	end
	
	def persisted?
		false
	end
	
end
