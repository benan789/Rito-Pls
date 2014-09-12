class SessionsController < ApplicationController
	def create

		data_json = JSON.parse(request.body.read)
		begin
			user = User.find_by({username: data_json["username"]})
		rescue

		end

		if user && user.authenticate(data_json["password"])
			@logged_in = true
		else
			@logged_in = false
		end

	end
end
