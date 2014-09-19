require 'digest/sha1'
class FingerprintsController < ApplicationController

	def fingerprint
  		useragent = Digest::SHA1.hexdigest(request.user_agent + request.remote_ip)
  		@fingerprint = Fingerprint.find_or_initialize_by({hash: useragent})
  		@fingerprint.save
	end
end
