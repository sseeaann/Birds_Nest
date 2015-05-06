class ContactsController < ApplicationController

	def index
		@contacts = User.find(current_user.id).contacts
	end

	def new
	end

	def edit
		@editContact = Contact.find(params[:id])
	end

	def update
  		Contact.find(params[:id]).update( contact_params )
  		redirect_to "/users/show"
  	end


	def destroy
		Contact.destroy(params[:id])
		redirect_to "/users/show"
	end

	def create
    @contact = Contact.new( contact_params )
	    if User.find(current_user.id).contacts.create(contact_params)
	      redirect_to '/users/show'
	    else
	      flash[:errors] = @contact.errors.full_messages
	      redirect_to '/contacts/new'
	    end
	end

	private

	def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :address_street, :address_apt, :address_city, :address_state, :address_zip, :phone)
    end

end
