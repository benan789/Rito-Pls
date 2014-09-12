if @logged_in == true
	json.status 'SUCCESS'
else
	json.status 'FAILURE'
end