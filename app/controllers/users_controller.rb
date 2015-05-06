class UsersController < ApplicationController


	def show
		@user = current_user
	    if @user.nil?
	      redirect_to '/mains'
	    else
		  @contacts = User.find(current_user.id).contacts
	    end

	end
end
