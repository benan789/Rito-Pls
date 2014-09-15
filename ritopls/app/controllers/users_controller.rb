class UsersController < ApplicationController
	def create
		data_json = JSON.parse(request.body.read)
		@user = User.new(:username => data_json['username'], :email => data_json['email'], :passwordarr => data_json['passwordarr'])
		@user.save
	end

	def find
		data_json = request.body.read
		@user = User.find_by({id: data_json})
	end

	def userfind
		data_json = JSON.parse(request.body.read)
		
		begin
			@newusername = User.find_by({username: data_json['newusername']})
		rescue 
			@newusername = nil
		end

		begin
			@newemail = User.find_by({email: data_json['newemail']})
		rescue
			@newemail = nil
		end

	end
end
