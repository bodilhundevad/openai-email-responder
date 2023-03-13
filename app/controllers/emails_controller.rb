class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    email = Email.new(email_params)
    if email.save
      @response = EmailGenerator.new(email).generate_response
    else # render alert
    end
  end
end
