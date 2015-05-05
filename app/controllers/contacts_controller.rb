class ContactsController < ApplicationController

	def new

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
