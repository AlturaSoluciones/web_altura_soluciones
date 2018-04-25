class HomeController < ApplicationController
  def index
  end

  def send_email
    contact_info = {
        name: params[:name],
        email: params[:email],
        subject: params[:subject],
        message: params[:message]
    }
    MessageMailer.new_request(contact_info).deliver_later
  end
end
