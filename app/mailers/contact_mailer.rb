class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to: TOMAIL, subject: 'お問い合わせ内容'+ @contact.subject_i18n
  end
end
