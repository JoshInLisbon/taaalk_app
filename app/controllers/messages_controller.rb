class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    message.save!
    redirect_to "/tlk/#{params['message']['tlk_id']}"
  end

  private

  def message_params
    params.require(:message).permit(:content, :tlk_id, :participant_id)
  end
end
