class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver
      redirect_to new_contact_path
    else
      redirect_to new_contact_path
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :message, :phone_number, :email, :subject,)
  end
end
