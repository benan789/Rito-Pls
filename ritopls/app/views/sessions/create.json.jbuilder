if @logged_in == true
	json.status 'SUCCESS'
	json.name @user
else
	json.status 'FAILURE'
end