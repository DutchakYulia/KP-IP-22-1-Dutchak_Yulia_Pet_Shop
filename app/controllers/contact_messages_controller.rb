class ContactMessagesController < ApplicationController
  def new
    @message = ContactMessage.new
  end

  def create
    @message = ContactMessage.new(message_params)
    @message.status = "new_msg"
    if @message.save
      redirect_to root_path, notice: "Повідомлення надіслано"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:contact_message).permit(:name, :email, :subject, :body)
  end
end
