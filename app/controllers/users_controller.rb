class UsersController < ApplicationController
	

	def show
		@user = current_user
		@contacts = User.find(current_user.id).contacts
	end
end
