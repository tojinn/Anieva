class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to: ENV["TOMAIL"], subject: 'お問い合わせ内容'+ @contact.subject_i18n
  end
end
