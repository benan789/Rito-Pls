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

	def usernamefind
		data_json = request.body.read
		@user = User.find_by({username: data_json})
	end
	
	def emailfind
		data_json = request.body.read
		@user = User.find_by({email: data_json})
	end
end
