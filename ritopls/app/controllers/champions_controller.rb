class ChampionsController < ApplicationController
	def index
		@champions = Champion.all
	end

	def show
		@champion = Champion.find(params[:id])
	end

	def votebalanced
		datajson = request.body.read
		@champion = Champion.find_by({key: datajson})
		@champion[:balanced] += 1
		@champion.save
	end

	def votebuff
		datajson = request.body.read
		@champion = Champion.find_by({key: datajson})
		@champion[:buff] += 1
		@champion.save
	end

	def votenerf
		datajson = request.body.read
		@champion = Champion.find_by({key: datajson})
		@champion[:nerf] += 1
		@champion.save
	end

	def voterework
		datajson = request.body.read
		@champion = Champion.find_by({key: datajson})
		@champion[:rework] += 1
		@champion.save
	end
end
