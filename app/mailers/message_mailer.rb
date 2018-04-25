class MessageMailer < ActionMailer::Base
  default from: "admin@alturasoluciones.com"

  def new_request(contact_info)
    @contact_info = OpenStruct.new contact_info
    mail(to: "david@alturasoluciones.com, gustavo@alturasoluciones.com", subject: "Nuevo contacto de #{@contact_info.name}")
  end

end