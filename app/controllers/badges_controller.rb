class BadgesController < ApplicationController
	def show
		@badge = badge.find(params[:id])
	end
end