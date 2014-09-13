class UsersController < ApplicationController
	def new
		@user = User.new(params.require(:user).permit(:username, :email, :password))
	end

	def find
		data_json = request.body.read
		@user = User.find_by({id: data_json})
	end
end
