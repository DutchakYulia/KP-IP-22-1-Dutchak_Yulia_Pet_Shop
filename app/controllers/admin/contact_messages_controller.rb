module Admin
  class ContactMessagesController < BaseController
    before_action :set_message, only: %i[show update destroy]

    def index
      @messages = ContactMessage.order(created_at: :desc)
    end

    def show; end

    def update
      if @message.update(params.require(:contact_message).permit(:status))
        redirect_to admin_contact_message_path(@message), notice: "Статус оновлено"
      else
        redirect_to admin_contact_message_path(@message), alert: @message.errors.full_messages.join(", ")
      end
    end

    def destroy
      @message.destroy
      redirect_to admin_contact_messages_path, notice: "Повідомлення видалено"
    end

    private

    def set_message
      @message = ContactMessage.find(params[:id])
    end
  end
end
