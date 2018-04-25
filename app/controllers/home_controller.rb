class HomeController < ApplicationController
  def index
  end

  def send_email
    MessageMailer.new_request(params).deliver_later
  end
end
