class ChampionsController < ApplicationController
	def index
		@champions = Champion.all
	end

	def balanced
		@champions = Champion.all
	end

	def buff
		@champions = Champion.all
	end

	def nerf
		@champions = Champion.all
	end

	def rework
		@champions = Champion.all
	end

	def vupdate
		@champions = Champion.all
	end

	def show
		@champion = Champion.find(params[:id].to_i)
		begin
			@comments = Comment.where(champion_id: params[:id])
		rescue
			@comments = nil
		end
	end

	def votebalanced
		useragent = Digest::SHA1.hexdigest(request.user_agent + request.remote_ip)
  		@fingerprint = Fingerprint.find_by({hash: useragent})
		datajson = request.body.read
		@champion = Champion.find_by({key: datajson})
  		@fingerprint[datajson] ||= [0,0,0]

		if @fingerprint[datajson][0] != 1
			@champion[:balanced] += 1
			@champion[:buff] -= 1 if @fingerprint[datajson][0] == 2 
			@champion[:nerf] -= 1 if @fingerprint[datajson][0] == 3
			@champion.save
			@fingerprint[datajson][0] = 1
			@fingerprint.upsert
		end
	end

	def votebuff
		useragent = Digest::SHA1.hexdigest(request.user_agent + request.remote_ip)
  		@fingerprint = Fingerprint.find_by({hash: useragent})
		datajson = request.body.read
		@champion = Champion.find_by({key: datajson})
  		@fingerprint[datajson] ||= [0,0,0]

		if @fingerprint[datajson][0] != 2
			@champion[:buff] += 1
			@champion[:balanced] -= 1 if @fingerprint[datajson][0] == 1
			@champion[:nerf] -= 1 if @fingerprint[datajson][0] == 3
			@champion.save
			@fingerprint[datajson][0] = 2
			@fingerprint.upsert
		end
	end

	def votenerf
		useragent = Digest::SHA1.hexdigest(request.user_agent + request.remote_ip)
  		@fingerprint = Fingerprint.find_by({hash: useragent})
  		datajson = request.body.read
		@champion = Champion.find_by({key: datajson})
		@fingerprint[datajson] ||= [0,0,0]

		if @fingerprint[datajson][0] != 3
			@champion[:nerf] += 1
			@champion[:balanced] -= 1 if @fingerprint[datajson][0] == 1
			@champion[:buff] -= 1 if @fingerprint[datajson][0] == 2
			@champion.save
			@fingerprint[datajson][0] = 3
			@fingerprint.upsert
		end
	end

	def voterework
		useragent = Digest::SHA1.hexdigest(request.user_agent + request.remote_ip)
  		@fingerprint = Fingerprint.find_by({hash: useragent})
  		datajson = request.body.read
		@champion = Champion.find_by({key: datajson})
  		@fingerprint[datajson] ||= [0,0,0]

		if @fingerprint[datajson][1] == 0
			@champion[:rework] += 1
			@champion.save
			@fingerprint[datajson][1] = 1
			@fingerprint.upsert
		else
			@champion[:rework] -= 1
			@champion.save
			@fingerprint[datajson][1] = 0
			@fingerprint.upsert
		end
	end

	def votevupdate
		useragent = Digest::SHA1.hexdigest(request.user_agent + request.remote_ip)
  		@fingerprint = Fingerprint.find_by({hash: useragent})
  		datajson = request.body.read
		@champion = Champion.find_by({key: datajson})
  		@fingerprint[datajson] ||= [0,0,0]
  		
		if @fingerprint[datajson][2] == 0
			@champion[:visual_update] += 1
			@champion.save
			@fingerprint[datajson][2] = 1
			@fingerprint.upsert
		else
			@champion[:visual_update] -= 1
			@champion.save
			@fingerprint[datajson][2] = 0
			@fingerprint.upsert
		end
	end
end
