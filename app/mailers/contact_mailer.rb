class ContactMailer < ApplicationMailer
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to contacts_path, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end
  def contact_mail(contact)
    @contact = contact
    mail to: "saekoy16@gmail.com", subject: "お問い合わせの確認メール"
  end

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
